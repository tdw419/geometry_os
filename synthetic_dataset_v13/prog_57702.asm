; DESCRIPTION: Composite: Creates a green rectangular region at (52, 139) spanning 70 by 52 pixels then Renders a cyan line between points (257, 211) and (25, 77) then Places a yellow dot at position (379, 63).
; PLAN: r0=52(x), r1=139(y), r2=70(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=211(y1), r7=25(x2), r8=77(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=63(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 139
LDI r2, 70
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 211
LDI r7, 25
LDI r8, 77
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 63
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
