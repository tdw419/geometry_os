; DESCRIPTION: Composite: Draws a cyan line from (93, 189) to (54, 216) then Sets a single white pixel at (138, 77) then Places a cyan circle of radius 62 at center (362, 193).
; PLAN: r0=93(x1), r1=189(y1), r2=54(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=77(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=193(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 189
LDI r2, 54
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 77
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 193
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
