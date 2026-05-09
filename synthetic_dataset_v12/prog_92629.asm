; DESCRIPTION: Composite: Places a cyan circle of radius 68 at center (363, 126) then Renders a cyan line between points (411, 216) and (457, 98) then Places a blue dot at position (257, 37).
; PLAN: r0=363(x), r1=126(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=216(y1), r7=457(x2), r8=98(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=37(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 126
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 216
LDI r7, 457
LDI r8, 98
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 37
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
