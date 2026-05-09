; DESCRIPTION: Composite: Places a orange line segment connecting (76, 201) to (259, 168) then Creates a blue rectangular region at (387, 60) spanning 18 by 24 pixels then Sets a single orange pixel at (221, 27).
; PLAN: r0=76(x1), r1=201(y1), r2=259(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=60(y), r7=18(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x), r11=27(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 201
LDI r2, 259
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 60
LDI r7, 18
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 27
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
