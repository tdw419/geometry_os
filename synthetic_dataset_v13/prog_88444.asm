; DESCRIPTION: Composite: Places a purple dot at position (497, 177) then Places a white line segment connecting (499, 250) to (118, 112) then Renders a black box of size 115x45 starting at (154, 133).
; PLAN: r0=497(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=250(y1), r7=118(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=133(y), r12=115(width), r13=45(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 499
LDI r6, 250
LDI r7, 118
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 133
LDI r12, 115
LDI r13, 45
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
