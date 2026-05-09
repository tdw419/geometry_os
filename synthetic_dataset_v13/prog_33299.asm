; DESCRIPTION: Composite: Places a green line segment connecting (262, 117) to (315, 73) then Sets a single black pixel at (153, 44) then Renders a magenta box of size 37x23 starting at (391, 123).
; PLAN: r0=262(x1), r1=117(y1), r2=315(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=123(y), r12=37(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 117
LDI r2, 315
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 391
LDI r11, 123
LDI r12, 37
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
