; DESCRIPTION: Composite: Sets a single black pixel at (290, 114) then Places a orange line segment connecting (483, 120) to (487, 168) then Places a green circle of radius 21 at center (271, 202).
; PLAN: r0=290(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=120(y1), r7=487(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=202(y), r12=21(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 120
LDI r7, 487
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 202
LDI r12, 21
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
