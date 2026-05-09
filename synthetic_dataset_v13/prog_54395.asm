; DESCRIPTION: Composite: Creates a yellow rectangular region at (91, 26) spanning 36 by 86 pixels then Draws a yellow line from (204, 80) to (342, 16).
; PLAN: r0=91(x), r1=26(y), r2=36(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x1), r6=80(y1), r7=342(x2), r8=16(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 26
LDI r2, 36
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 80
LDI r7, 342
LDI r8, 16
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
