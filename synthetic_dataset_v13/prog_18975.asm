; DESCRIPTION: Composite: Renders a white disk with center (279, 118) and radius 59 then Draws a magenta line from (473, 37) to (89, 182) then Places a green dot at position (309, 2).
; PLAN: r0=279(x), r1=118(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=37(y1), r7=89(x2), r8=182(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=2(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 118
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 37
LDI r7, 89
LDI r8, 182
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 2
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
