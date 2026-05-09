; DESCRIPTION: Composite: Draws a black line from (211, 196) to (219, 43) then Creates a purple rectangular region at (254, 117) spanning 118 by 53 pixels.
; PLAN: r0=211(x1), r1=196(y1), r2=219(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=117(y), r7=118(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 196
LDI r2, 219
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 117
LDI r7, 118
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
