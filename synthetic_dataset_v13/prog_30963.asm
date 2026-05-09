; DESCRIPTION: Composite: Renders a cyan line between points (253, 61) and (235, 226) then Creates a yellow rectangular region at (92, 136) spanning 36 by 22 pixels.
; PLAN: r0=253(x1), r1=61(y1), r2=235(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=136(y), r7=36(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 61
LDI r2, 235
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 136
LDI r7, 36
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
