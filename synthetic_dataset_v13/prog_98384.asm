; DESCRIPTION: Composite: Sets a single purple pixel at (193, 150) then Places a green line segment connecting (304, 27) to (56, 214) then Creates a green circular shape at (244, 71) with radius 57.
; PLAN: r0=193(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=27(y1), r7=56(x2), r8=214(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=71(y), r12=57(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 27
LDI r7, 56
LDI r8, 214
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 71
LDI r12, 57
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
