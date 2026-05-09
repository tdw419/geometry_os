; DESCRIPTION: Composite: Places a red 68x71 rectangle at position (203, 33) then Places a black line segment connecting (56, 246) to (144, 15).
; PLAN: r0=203(x), r1=33(y), r2=68(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x1), r6=246(y1), r7=144(x2), r8=15(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 33
LDI r2, 68
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 246
LDI r7, 144
LDI r8, 15
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
