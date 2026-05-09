; DESCRIPTION: Composite: Places a yellow line segment connecting (342, 170) to (138, 217) then Places a green circle of radius 65 at center (214, 71) then Places a magenta dot at position (155, 164).
; PLAN: r0=342(x1), r1=170(y1), r2=138(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=71(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=164(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 170
LDI r2, 138
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 71
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 164
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
