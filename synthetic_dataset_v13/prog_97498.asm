; DESCRIPTION: Composite: Draws a white line from (156, 109) to (138, 186) then Renders a yellow disk with center (235, 146) and radius 80.
; PLAN: r0=156(x1), r1=109(y1), r2=138(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=146(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 109
LDI r2, 138
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 146
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
