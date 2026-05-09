; DESCRIPTION: Composite: Creates a black rectangular region at (393, 109) spanning 21 by 36 pixels then Places a green line segment connecting (264, 48) to (444, 154) then Places a blue dot at position (64, 217).
; PLAN: r0=393(x), r1=109(y), r2=21(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x1), r6=48(y1), r7=444(x2), r8=154(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=217(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 109
LDI r2, 21
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 48
LDI r7, 444
LDI r8, 154
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 217
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
