; DESCRIPTION: Composite: Sets a single black pixel at (211, 70) then Places a cyan circle of radius 40 at center (43, 210) then Renders a black line between points (220, 245) and (162, 127).
; PLAN: r0=211(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=210(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x1), r11=245(y1), r12=162(x2), r13=127(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 43
LDI r6, 210
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 245
LDI r12, 162
LDI r13, 127
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
