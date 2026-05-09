; DESCRIPTION: Composite: Places a green dot at position (86, 199) then Places a white circle of radius 16 at center (242, 229) then Draws a purple line from (486, 153) to (83, 61).
; PLAN: r0=86(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=229(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=153(y1), r12=83(x2), r13=61(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 242
LDI r6, 229
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 153
LDI r12, 83
LDI r13, 61
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
