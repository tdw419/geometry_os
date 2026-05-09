; DESCRIPTION: Composite: Renders a white line between points (257, 179) and (213, 13) then Places a magenta circle of radius 79 at center (207, 103) then Sets a single green pixel at (205, 215).
; PLAN: r0=257(x1), r1=179(y1), r2=213(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=103(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=215(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 179
LDI r2, 213
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 103
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 215
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
