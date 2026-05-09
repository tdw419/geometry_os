; DESCRIPTION: Composite: Draws a orange circle centered at (83, 55) with radius 23 then Draws a black line from (148, 73) to (439, 186).
; PLAN: r0=83(x), r1=55(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=73(y1), r7=439(x2), r8=186(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 55
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 73
LDI r7, 439
LDI r8, 186
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
