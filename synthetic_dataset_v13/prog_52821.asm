; DESCRIPTION: Composite: Places a cyan 11x45 rectangle at position (352, 10) then Renders a purple line between points (106, 215) and (431, 151) then Creates a purple circular shape at (449, 65) with radius 49.
; PLAN: r0=352(x), r1=10(y), r2=11(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=215(y1), r7=431(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=65(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 10
LDI r2, 11
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 215
LDI r7, 431
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 65
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
