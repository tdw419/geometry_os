; DESCRIPTION: Composite: Places a yellow circle of radius 30 at center (444, 52) then Renders a cyan line between points (490, 178) and (480, 179) then Places a green dot at position (303, 56).
; PLAN: r0=444(x), r1=52(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=178(y1), r7=480(x2), r8=179(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=56(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 444
LDI r1, 52
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 178
LDI r7, 480
LDI r8, 179
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 56
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
