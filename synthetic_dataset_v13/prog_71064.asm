; DESCRIPTION: Composite: Renders a cyan line between points (124, 94) and (13, 253) then Sets a single magenta pixel at (213, 157) then Places a yellow circle of radius 63 at center (194, 63).
; PLAN: r0=124(x1), r1=94(y1), r2=13(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=157(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=63(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 124
LDI r1, 94
LDI r2, 13
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 157
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 63
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
