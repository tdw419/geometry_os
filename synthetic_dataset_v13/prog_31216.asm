; DESCRIPTION: Composite: Places a orange dot at position (231, 3) then Creates a blue circular shape at (331, 77) with radius 69 then Renders a white line between points (342, 10) and (129, 92).
; PLAN: r0=231(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=77(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=10(y1), r12=129(x2), r13=92(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 331
LDI r6, 77
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 10
LDI r12, 129
LDI r13, 92
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
