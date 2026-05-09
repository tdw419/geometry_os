; DESCRIPTION: Composite: Renders a red line between points (137, 140) and (248, 189) then Creates a white rectangular region at (242, 5) spanning 33 by 44 pixels.
; PLAN: r0=137(x1), r1=140(y1), r2=248(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=5(y), r7=33(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 140
LDI r2, 248
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 5
LDI r7, 33
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
