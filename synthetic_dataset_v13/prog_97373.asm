; DESCRIPTION: Composite: Creates a black rectangular region at (169, 16) spanning 92 by 95 pixels then Places a purple line segment connecting (236, 241) to (21, 213).
; PLAN: r0=169(x), r1=16(y), r2=92(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=241(y1), r7=21(x2), r8=213(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 16
LDI r2, 92
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 241
LDI r7, 21
LDI r8, 213
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
