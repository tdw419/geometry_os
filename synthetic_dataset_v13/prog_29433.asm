; DESCRIPTION: Composite: Places a orange circle of radius 46 at center (255, 137) then Sets a single orange pixel at (372, 235) then Places a red line segment connecting (333, 44) to (425, 154).
; PLAN: r0=255(x), r1=137(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=333(x1), r11=44(y1), r12=425(x2), r13=154(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 137
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 333
LDI r11, 44
LDI r12, 425
LDI r13, 154
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
