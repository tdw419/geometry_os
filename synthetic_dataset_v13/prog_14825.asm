; DESCRIPTION: Composite: Draws a magenta circle centered at (328, 174) with radius 37 then Sets a single cyan pixel at (494, 126) then Draws a blue line from (285, 134) to (111, 184).
; PLAN: r0=328(x), r1=174(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=126(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=285(x1), r11=134(y1), r12=111(x2), r13=184(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 174
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 126
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 285
LDI r11, 134
LDI r12, 111
LDI r13, 184
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
