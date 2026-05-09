; DESCRIPTION: Composite: Draws a cyan circle centered at (178, 118) with radius 63 then Renders a cyan line between points (439, 49) and (114, 204) then Places a yellow dot at position (29, 140).
; PLAN: r0=178(x), r1=118(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x1), r6=49(y1), r7=114(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=140(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 118
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 49
LDI r7, 114
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 140
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
