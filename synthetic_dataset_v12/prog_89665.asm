; DESCRIPTION: Composite: Draws a magenta line from (150, 145) to (384, 65) then Renders a magenta disk with center (26, 82) and radius 22 then Sets a single magenta pixel at (153, 3).
; PLAN: r0=150(x1), r1=145(y1), r2=384(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=82(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=3(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 145
LDI r2, 384
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 82
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 3
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
