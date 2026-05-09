; DESCRIPTION: Draws a cyan rectangle at (321, 99) with width 94 and height 80.
; PLAN: r0=321(x), r1=99(y), r2=94(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 99
LDI r2, 94
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
