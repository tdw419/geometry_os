; DESCRIPTION: Composite: Creates a cyan rectangular region at (362, 123) spanning 61 by 90 pixels then Renders a black line between points (276, 6) and (237, 32) then Renders a orange disk with center (20, 141) and radius 19.
; PLAN: r0=362(x), r1=123(y), r2=61(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=6(y1), r7=237(x2), r8=32(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=20(x), r11=141(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 123
LDI r2, 61
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 6
LDI r7, 237
LDI r8, 32
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 141
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
