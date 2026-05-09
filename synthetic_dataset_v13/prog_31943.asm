; DESCRIPTION: Composite: Places a green line segment connecting (402, 123) to (466, 162) then Creates a cyan circular shape at (295, 141) with radius 80 then Sets a single magenta pixel at (85, 229).
; PLAN: r0=402(x1), r1=123(y1), r2=466(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=141(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x), r11=229(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 123
LDI r2, 466
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 141
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 229
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
