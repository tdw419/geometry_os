; DESCRIPTION: Draws a cyan rectangle at (180, 38) with width 113 and height 56.
; PLAN: r0=180(x), r1=38(y), r2=113(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 38
LDI r2, 113
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
