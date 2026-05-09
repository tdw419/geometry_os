; DESCRIPTION: Composite: Renders a black line between points (404, 50) and (92, 22) then Sets a single red pixel at (179, 152) then Renders a orange disk with center (386, 90) and radius 72.
; PLAN: r0=404(x1), r1=50(y1), r2=92(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=152(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=386(x), r11=90(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 404
LDI r1, 50
LDI r2, 92
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 152
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 386
LDI r11, 90
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
