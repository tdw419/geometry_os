; DESCRIPTION: Composite: Places a black 106x63 rectangle at position (104, 178) then Places a yellow line segment connecting (62, 227) to (90, 169).
; PLAN: r0=104(x), r1=178(y), r2=106(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=227(y1), r7=90(x2), r8=169(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 178
LDI r2, 106
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 227
LDI r7, 90
LDI r8, 169
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
