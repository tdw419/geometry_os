; DESCRIPTION: Composite: Renders a blue box of size 75x25 starting at (18, 56) then Renders a yellow disk with center (463, 134) and radius 40 then Sets a single purple pixel at (463, 226).
; PLAN: r0=18(x), r1=56(y), r2=75(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=134(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=226(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 56
LDI r2, 75
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 134
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 226
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
