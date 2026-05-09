; DESCRIPTION: Composite: Renders a purple disk with center (214, 145) and radius 31 then Sets a single magenta pixel at (345, 213) then Draws a red line from (258, 133) to (509, 17).
; PLAN: r0=214(x), r1=145(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=213(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=258(x1), r11=133(y1), r12=509(x2), r13=17(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 145
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 213
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 258
LDI r11, 133
LDI r12, 509
LDI r13, 17
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
