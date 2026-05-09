; DESCRIPTION: Composite: Draws a white line from (42, 177) to (373, 96) then Creates a magenta circular shape at (237, 41) with radius 29 then Sets a single blue pixel at (81, 55).
; PLAN: r0=42(x1), r1=177(y1), r2=373(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=41(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=55(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 177
LDI r2, 373
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 41
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 55
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
