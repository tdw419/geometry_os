; DESCRIPTION: Composite: Places a yellow dot at position (291, 100) then Draws a yellow circle centered at (347, 162) with radius 25 then Renders a cyan line between points (455, 245) and (317, 198).
; PLAN: r0=291(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=162(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x1), r11=245(y1), r12=317(x2), r13=198(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 347
LDI r6, 162
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 245
LDI r12, 317
LDI r13, 198
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
