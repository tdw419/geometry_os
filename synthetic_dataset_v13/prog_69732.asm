; DESCRIPTION: Composite: Renders a orange line between points (266, 132) and (260, 53) then Places a purple 112x14 rectangle at position (152, 135).
; PLAN: r0=266(x1), r1=132(y1), r2=260(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=135(y), r7=112(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 132
LDI r2, 260
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 135
LDI r7, 112
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
