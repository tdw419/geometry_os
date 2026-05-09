; DESCRIPTION: Composite: Places a purple dot at position (449, 1) then Creates a blue circular shape at (398, 180) with radius 45 then Places a red line segment connecting (256, 102) to (398, 10).
; PLAN: r0=449(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=180(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x1), r11=102(y1), r12=398(x2), r13=10(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 398
LDI r6, 180
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 102
LDI r12, 398
LDI r13, 10
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
