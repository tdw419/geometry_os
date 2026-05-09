; DESCRIPTION: Composite: Renders a yellow line between points (219, 163) and (333, 110) then Creates a magenta circular shape at (393, 83) with radius 62 then Places a green dot at position (505, 213).
; PLAN: r0=219(x1), r1=163(y1), r2=333(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=83(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x), r11=213(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 163
LDI r2, 333
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 83
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 213
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
