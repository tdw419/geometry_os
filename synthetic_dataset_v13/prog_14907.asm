; DESCRIPTION: Draws a cyan rectangle at (367, 20) with width 110 and height 102.
; PLAN: r0=367(x), r1=20(y), r2=110(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 20
LDI r2, 110
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
