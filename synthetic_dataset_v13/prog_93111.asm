; DESCRIPTION: Composite: Sets a single black pixel at (90, 121) then Renders a green line between points (356, 80) and (12, 235) then Creates a red circular shape at (406, 146) with radius 36.
; PLAN: r0=90(x), r1=121(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=80(y1), r7=12(x2), r8=235(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=146(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 121
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 356
LDI r6, 80
LDI r7, 12
LDI r8, 235
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 146
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
