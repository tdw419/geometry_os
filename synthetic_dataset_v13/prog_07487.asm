; DESCRIPTION: Composite: Places a magenta 73x20 rectangle at position (433, 203) then Renders a black line between points (364, 143) and (369, 133).
; PLAN: r0=433(x), r1=203(y), r2=73(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=143(y1), r7=369(x2), r8=133(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 203
LDI r2, 73
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 143
LDI r7, 369
LDI r8, 133
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
