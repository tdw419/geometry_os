; DESCRIPTION: Composite: Creates a black rectangular region at (30, 70) spanning 116 by 51 pixels then Renders a white line between points (433, 10) and (248, 30).
; PLAN: r0=30(x), r1=70(y), r2=116(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=10(y1), r7=248(x2), r8=30(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 70
LDI r2, 116
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 10
LDI r7, 248
LDI r8, 30
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
