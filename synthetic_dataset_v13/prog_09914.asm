; DESCRIPTION: Composite: Places a magenta 11x50 rectangle at position (236, 31) then Places a red line segment connecting (44, 191) to (173, 147).
; PLAN: r0=236(x), r1=31(y), r2=11(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x1), r6=191(y1), r7=173(x2), r8=147(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 31
LDI r2, 11
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 191
LDI r7, 173
LDI r8, 147
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
