; DESCRIPTION: Composite: Draws a black line from (213, 233) to (234, 105) then Renders a yellow box of size 110x66 starting at (351, 13).
; PLAN: r0=213(x1), r1=233(y1), r2=234(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=13(y), r7=110(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 233
LDI r2, 234
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 13
LDI r7, 110
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
