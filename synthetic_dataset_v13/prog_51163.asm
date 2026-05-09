; DESCRIPTION: Composite: Renders a yellow line between points (18, 240) and (220, 68) then Places a magenta circle of radius 64 at center (405, 121) then Places a black dot at position (430, 129).
; PLAN: r0=18(x1), r1=240(y1), r2=220(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=121(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 240
LDI r2, 220
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 121
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT
