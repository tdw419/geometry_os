; DESCRIPTION: Composite: Places a black line segment connecting (291, 191) to (162, 125) then Places a purple 103x89 rectangle at position (381, 150).
; PLAN: r0=291(x1), r1=191(y1), r2=162(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=150(y), r7=103(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 191
LDI r2, 162
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 150
LDI r7, 103
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
