; DESCRIPTION: Composite: Creates a purple circular shape at (90, 195) with radius 20 then Sets a single purple pixel at (59, 168) then Draws a purple line from (229, 51) to (120, 121).
; PLAN: r0=90(x), r1=195(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=168(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=51(y1), r12=120(x2), r13=121(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 195
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 168
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 51
LDI r12, 120
LDI r13, 121
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
