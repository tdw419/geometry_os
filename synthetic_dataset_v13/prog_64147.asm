; DESCRIPTION: Composite: Draws a cyan circle centered at (132, 113) with radius 13 then Draws a black line from (216, 118) to (354, 42) then Sets a single yellow pixel at (113, 23).
; PLAN: r0=132(x), r1=113(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x1), r6=118(y1), r7=354(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=23(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 113
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 118
LDI r7, 354
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 23
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
