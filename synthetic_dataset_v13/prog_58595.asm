; DESCRIPTION: Composite: Places a purple 101x87 rectangle at position (170, 40) then Renders a green disk with center (444, 80) and radius 52 then Sets a single magenta pixel at (175, 217).
; PLAN: r0=170(x), r1=40(y), r2=101(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=80(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=217(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 170
LDI r1, 40
LDI r2, 101
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 80
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 217
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
