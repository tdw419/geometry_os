; DESCRIPTION: Composite: Creates a purple rectangular region at (214, 17) spanning 72 by 18 pixels then Draws a purple line from (365, 228) to (259, 175).
; PLAN: r0=214(x), r1=17(y), r2=72(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=228(y1), r7=259(x2), r8=175(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 17
LDI r2, 72
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 228
LDI r7, 259
LDI r8, 175
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
