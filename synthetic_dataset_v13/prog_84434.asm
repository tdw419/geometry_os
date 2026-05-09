; DESCRIPTION: Composite: Renders a magenta line between points (45, 48) and (209, 244) then Draws a purple circle centered at (440, 194) with radius 20 then Places a black dot at position (179, 138).
; PLAN: r0=45(x1), r1=48(y1), r2=209(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=194(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=138(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 48
LDI r2, 209
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 194
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 138
LDI r12, 0x000000
PSET r10, r11, r12
HALT
