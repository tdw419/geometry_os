; DESCRIPTION: Composite: Places a purple line segment connecting (460, 189) to (130, 99) then Renders a green box of size 33x82 starting at (452, 109) then Sets a single purple pixel at (260, 207).
; PLAN: r0=460(x1), r1=189(y1), r2=130(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=109(y), r7=33(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=207(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 189
LDI r2, 130
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 109
LDI r7, 33
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 207
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
