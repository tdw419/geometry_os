; DESCRIPTION: Composite: Places a green dot at position (162, 244) then Places a red line segment connecting (274, 19) to (84, 229) then Places a black 75x75 rectangle at position (87, 58).
; PLAN: r0=162(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=19(y1), r7=84(x2), r8=229(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=58(y), r12=75(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 19
LDI r7, 84
LDI r8, 229
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 58
LDI r12, 75
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
