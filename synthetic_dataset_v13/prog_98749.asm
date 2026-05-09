; DESCRIPTION: Composite: Draws a cyan circle centered at (181, 134) with radius 17 then Sets a single cyan pixel at (408, 207) then Places a blue line segment connecting (245, 127) to (168, 202).
; PLAN: r0=181(x), r1=134(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=207(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=245(x1), r11=127(y1), r12=168(x2), r13=202(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 134
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 207
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 245
LDI r11, 127
LDI r12, 168
LDI r13, 202
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
