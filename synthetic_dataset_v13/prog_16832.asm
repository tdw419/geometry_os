; DESCRIPTION: Composite: Places a white line segment connecting (402, 231) to (195, 195) then Creates a cyan circular shape at (222, 50) with radius 21 then Places a green dot at position (132, 182).
; PLAN: r0=402(x1), r1=231(y1), r2=195(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=50(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=182(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 231
LDI r2, 195
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 50
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 182
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
