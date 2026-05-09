; DESCRIPTION: Draws a cyan rectangle at (275, 135) with width 82 and height 117.
; PLAN: r0=275(x), r1=135(y), r2=82(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 135
LDI r2, 82
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
