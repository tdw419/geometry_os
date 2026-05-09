; DESCRIPTION: Composite: Places a green dot at position (32, 128) then Places a orange circle of radius 29 at center (134, 202) then Renders a white line between points (490, 250) and (231, 26).
; PLAN: r0=32(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=202(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x1), r11=250(y1), r12=231(x2), r13=26(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 134
LDI r6, 202
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 250
LDI r12, 231
LDI r13, 26
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
