; DESCRIPTION: Composite: Places a yellow circle of radius 19 at center (73, 219) then Renders a red line between points (177, 135) and (272, 235).
; PLAN: r0=73(x), r1=219(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x1), r6=135(y1), r7=272(x2), r8=235(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 219
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 135
LDI r7, 272
LDI r8, 235
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
