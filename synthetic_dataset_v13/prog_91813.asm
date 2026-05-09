; DESCRIPTION: Composite: Sets a single yellow pixel at (352, 201) then Renders a black line between points (328, 185) and (115, 85) then Places a yellow 38x78 rectangle at position (287, 57).
; PLAN: r0=352(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=328(x1), r6=185(y1), r7=115(x2), r8=85(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=57(y), r12=38(width), r13=78(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 328
LDI r6, 185
LDI r7, 115
LDI r8, 85
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 57
LDI r12, 38
LDI r13, 78
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
