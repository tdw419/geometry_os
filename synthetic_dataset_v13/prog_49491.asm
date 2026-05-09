; DESCRIPTION: Composite: Places a orange line segment connecting (448, 116) to (57, 15) then Places a black 32x104 rectangle at position (309, 70).
; PLAN: r0=448(x1), r1=116(y1), r2=57(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=70(y), r7=32(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 116
LDI r2, 57
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 70
LDI r7, 32
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
