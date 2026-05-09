; DESCRIPTION: Composite: Draws a cyan line from (265, 247) to (416, 51) then Sets a single magenta pixel at (448, 127) then Renders a cyan disk with center (162, 95) and radius 29.
; PLAN: r0=265(x1), r1=247(y1), r2=416(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=162(x), r11=95(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 247
LDI r2, 416
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 162
LDI r11, 95
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
