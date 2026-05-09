; DESCRIPTION: Composite: Places a yellow circle of radius 50 at center (221, 66) then Sets a single black pixel at (322, 238) then Draws a cyan line from (254, 226) to (266, 196).
; PLAN: r0=221(x), r1=66(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=238(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=254(x1), r11=226(y1), r12=266(x2), r13=196(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 66
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 238
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 254
LDI r11, 226
LDI r12, 266
LDI r13, 196
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
