; DESCRIPTION: Composite: Renders a green line between points (319, 188) and (191, 228) then Renders a magenta disk with center (257, 151) and radius 12 then Sets a single white pixel at (132, 70).
; PLAN: r0=319(x1), r1=188(y1), r2=191(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=151(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=70(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 188
LDI r2, 191
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 151
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 70
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
