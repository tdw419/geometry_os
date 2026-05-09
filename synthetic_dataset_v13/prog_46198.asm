; DESCRIPTION: Composite: Places a cyan dot at position (245, 191) then Creates a black circular shape at (388, 44) with radius 15 then Renders a yellow line between points (171, 214) and (423, 149).
; PLAN: r0=245(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=44(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x1), r11=214(y1), r12=423(x2), r13=149(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 44
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 214
LDI r12, 423
LDI r13, 149
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
