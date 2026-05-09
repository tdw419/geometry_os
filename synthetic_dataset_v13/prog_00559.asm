; DESCRIPTION: Composite: Renders a red line between points (305, 184) and (152, 235) then Creates a yellow rectangular region at (427, 97) spanning 29 by 55 pixels.
; PLAN: r0=305(x1), r1=184(y1), r2=152(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=97(y), r7=29(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 184
LDI r2, 152
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 97
LDI r7, 29
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
