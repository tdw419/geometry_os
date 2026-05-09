; DESCRIPTION: Composite: Creates a yellow rectangular region at (217, 18) spanning 92 by 92 pixels then Renders a white line between points (91, 17) and (194, 13).
; PLAN: r0=217(x), r1=18(y), r2=92(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=17(y1), r7=194(x2), r8=13(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 18
LDI r2, 92
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 17
LDI r7, 194
LDI r8, 13
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
