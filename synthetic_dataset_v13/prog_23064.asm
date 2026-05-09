; DESCRIPTION: Composite: Renders a magenta line between points (216, 175) and (196, 226) then Creates a green circular shape at (123, 152) with radius 79 then Sets a single purple pixel at (64, 167).
; PLAN: r0=216(x1), r1=175(y1), r2=196(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=152(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=167(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 175
LDI r2, 196
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 152
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 167
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
