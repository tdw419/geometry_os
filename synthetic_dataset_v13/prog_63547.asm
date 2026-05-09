; DESCRIPTION: Composite: Sets a single yellow pixel at (35, 99) then Draws a green line from (458, 186) to (53, 130) then Draws a white rectangle at (237, 22) with width 100 and height 44.
; PLAN: r0=35(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=458(x1), r6=186(y1), r7=53(x2), r8=130(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=22(y), r12=100(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 458
LDI r6, 186
LDI r7, 53
LDI r8, 130
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 22
LDI r12, 100
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
