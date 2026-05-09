; DESCRIPTION: Composite: Renders a yellow line between points (208, 181) and (72, 184) then Renders a green box of size 39x111 starting at (100, 141) then Sets a single green pixel at (236, 99).
; PLAN: r0=208(x1), r1=181(y1), r2=72(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=141(y), r7=39(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=99(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 181
LDI r2, 72
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 141
LDI r7, 39
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 99
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
