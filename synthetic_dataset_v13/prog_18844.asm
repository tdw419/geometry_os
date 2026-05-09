; DESCRIPTION: Composite: Creates a green rectangular region at (183, 17) spanning 105 by 70 pixels then Renders a black line between points (39, 5) and (22, 129) then Places a purple dot at position (414, 132).
; PLAN: r0=183(x), r1=17(y), r2=105(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x1), r6=5(y1), r7=22(x2), r8=129(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=132(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 17
LDI r2, 105
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 5
LDI r7, 22
LDI r8, 129
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 132
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
