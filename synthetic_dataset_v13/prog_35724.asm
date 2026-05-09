; DESCRIPTION: Composite: Places a purple dot at position (508, 126) then Creates a green circular shape at (411, 57) with radius 42 then Places a purple line segment connecting (271, 254) to (18, 102).
; PLAN: r0=508(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=57(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x1), r11=254(y1), r12=18(x2), r13=102(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 57
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 254
LDI r12, 18
LDI r13, 102
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
