; DESCRIPTION: Composite: Creates a yellow circular shape at (322, 92) with radius 15 then Sets a single purple pixel at (197, 196) then Draws a cyan line from (88, 117) to (319, 180).
; PLAN: r0=322(x), r1=92(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=196(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=88(x1), r11=117(y1), r12=319(x2), r13=180(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 92
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 196
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 88
LDI r11, 117
LDI r12, 319
LDI r13, 180
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
