; DESCRIPTION: Composite: Renders a cyan line between points (204, 197) and (194, 95) then Draws a magenta circle centered at (50, 75) with radius 13 then Places a cyan dot at position (396, 216).
; PLAN: r0=204(x1), r1=197(y1), r2=194(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=75(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=216(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 197
LDI r2, 194
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 75
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 216
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
