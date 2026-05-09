; DESCRIPTION: Composite: Sets a single cyan pixel at (45, 100) then Creates a black circular shape at (61, 214) with radius 40 then Places a yellow line segment connecting (415, 32) to (509, 96).
; PLAN: r0=45(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=214(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x1), r11=32(y1), r12=509(x2), r13=96(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 214
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 32
LDI r12, 509
LDI r13, 96
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
