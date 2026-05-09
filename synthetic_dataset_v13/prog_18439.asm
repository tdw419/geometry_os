; DESCRIPTION: Draws a cyan rectangle at (296, 51) with width 77 and height 113.
; PLAN: r0=296(x), r1=51(y), r2=77(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 51
LDI r2, 77
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
