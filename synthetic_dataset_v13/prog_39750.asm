; DESCRIPTION: Composite: Draws a cyan line from (138, 238) to (336, 45) then Sets a single magenta pixel at (96, 210) then Renders a blue disk with center (464, 217) and radius 19.
; PLAN: r0=138(x1), r1=238(y1), r2=336(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=210(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=464(x), r11=217(y), r12=19(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 238
LDI r2, 336
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 210
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 464
LDI r11, 217
LDI r12, 19
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
