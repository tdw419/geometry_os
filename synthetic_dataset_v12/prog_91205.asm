; DESCRIPTION: Composite: Places a purple line segment connecting (455, 86) to (388, 54) then Renders a purple box of size 41x91 starting at (282, 43) then Sets a single yellow pixel at (434, 48).
; PLAN: r0=455(x1), r1=86(y1), r2=388(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=43(y), r7=41(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x), r11=48(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 455
LDI r1, 86
LDI r2, 388
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 43
LDI r7, 41
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 48
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
