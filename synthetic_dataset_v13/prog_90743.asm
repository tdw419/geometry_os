; DESCRIPTION: Composite: Places a black line segment connecting (59, 195) to (99, 157) then Renders a yellow disk with center (98, 153) and radius 72 then Places a yellow dot at position (59, 246).
; PLAN: r0=59(x1), r1=195(y1), r2=99(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=153(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x), r11=246(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 195
LDI r2, 99
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 153
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 246
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
