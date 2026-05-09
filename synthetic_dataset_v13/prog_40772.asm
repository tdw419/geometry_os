; DESCRIPTION: Composite: Places a purple line segment connecting (5, 177) to (369, 21) then Places a orange 80x28 rectangle at position (209, 132) then Sets a single purple pixel at (506, 130).
; PLAN: r0=5(x1), r1=177(y1), r2=369(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=132(y), r7=80(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=130(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 177
LDI r2, 369
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 132
LDI r7, 80
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 130
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
