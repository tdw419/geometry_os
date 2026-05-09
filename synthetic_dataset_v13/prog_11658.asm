; DESCRIPTION: Composite: Creates a blue rectangular region at (72, 148) spanning 65 by 58 pixels then Renders a white line between points (194, 146) and (44, 255).
; PLAN: r0=72(x), r1=148(y), r2=65(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x1), r6=146(y1), r7=44(x2), r8=255(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 148
LDI r2, 65
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 146
LDI r7, 44
LDI r8, 255
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
