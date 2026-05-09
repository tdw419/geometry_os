; DESCRIPTION: Composite: Places a orange 117x101 rectangle at position (106, 84) then Renders a green line between points (233, 86) and (314, 92) then Sets a single cyan pixel at (419, 18).
; PLAN: r0=106(x), r1=84(y), r2=117(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=86(y1), r7=314(x2), r8=92(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=18(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 84
LDI r2, 117
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 86
LDI r7, 314
LDI r8, 92
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 18
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
