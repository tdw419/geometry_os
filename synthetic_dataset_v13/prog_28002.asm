; DESCRIPTION: Composite: Places a yellow 81x58 rectangle at position (104, 15) then Places a purple line segment connecting (309, 116) to (365, 248).
; PLAN: r0=104(x), r1=15(y), r2=81(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=116(y1), r7=365(x2), r8=248(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 15
LDI r2, 81
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 116
LDI r7, 365
LDI r8, 248
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
