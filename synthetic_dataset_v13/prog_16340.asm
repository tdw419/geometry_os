; DESCRIPTION: Composite: Places a black dot at position (393, 227) then Places a orange line segment connecting (388, 47) to (92, 68) then Places a green circle of radius 19 at center (23, 108).
; PLAN: r0=393(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=47(y1), r7=92(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=108(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 47
LDI r7, 92
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 108
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
