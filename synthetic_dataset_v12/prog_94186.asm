; DESCRIPTION: Composite: Places a yellow line segment connecting (272, 109) to (364, 200) then Places a magenta 82x110 rectangle at position (250, 39) then Places a black dot at position (80, 219).
; PLAN: r0=272(x1), r1=109(y1), r2=364(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=39(y), r7=82(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=219(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 109
LDI r2, 364
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 39
LDI r7, 82
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 219
LDI r12, 0x000000
PSET r10, r11, r12
HALT
