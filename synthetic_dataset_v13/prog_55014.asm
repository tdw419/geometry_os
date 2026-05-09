; DESCRIPTION: Composite: Renders a white line between points (164, 43) and (404, 169) then Renders a black box of size 19x104 starting at (181, 104) then Places a blue dot at position (14, 227).
; PLAN: r0=164(x1), r1=43(y1), r2=404(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=104(y), r7=19(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=14(x), r11=227(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 43
LDI r2, 404
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 104
LDI r7, 19
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 227
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
