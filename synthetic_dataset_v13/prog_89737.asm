; DESCRIPTION: Composite: Renders a red line between points (455, 234) and (66, 72) then Renders a black box of size 44x15 starting at (457, 116).
; PLAN: r0=455(x1), r1=234(y1), r2=66(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=116(y), r7=44(width), r8=15(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 234
LDI r2, 66
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 116
LDI r7, 44
LDI r8, 15
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
