; DESCRIPTION: Draws a cyan rectangle at (99, 161) with width 56 and height 20.
; PLAN: r0=99(x), r1=161(y), r2=56(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 161
LDI r2, 56
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
