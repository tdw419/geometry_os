; DESCRIPTION: Composite: Creates a blue circular shape at (211, 217) with radius 24 then Places a magenta line segment connecting (202, 27) to (96, 165) then Sets a single blue pixel at (146, 127).
; PLAN: r0=211(x), r1=217(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x1), r6=27(y1), r7=96(x2), r8=165(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=127(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 217
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 27
LDI r7, 96
LDI r8, 165
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 127
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
