; DESCRIPTION: Composite: Places a magenta line segment connecting (273, 141) to (444, 128) then Renders a blue box of size 23x13 starting at (382, 43) then Places a green dot at position (492, 80).
; PLAN: r0=273(x1), r1=141(y1), r2=444(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=43(y), r7=23(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x), r11=80(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 141
LDI r2, 444
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 43
LDI r7, 23
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 80
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
