; DESCRIPTION: Composite: Places a red 28x120 rectangle at position (68, 110) then Sets a single white pixel at (166, 117) then Places a black line segment connecting (459, 94) to (309, 132).
; PLAN: r0=68(x), r1=110(y), r2=28(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=117(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=459(x1), r11=94(y1), r12=309(x2), r13=132(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 110
LDI r2, 28
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 117
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 459
LDI r11, 94
LDI r12, 309
LDI r13, 132
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
