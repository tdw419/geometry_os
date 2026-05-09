; DESCRIPTION: Composite: Creates a red rectangular region at (354, 215) spanning 79 by 33 pixels then Renders a orange line between points (213, 184) and (100, 117) then Renders a black disk with center (52, 202) and radius 45.
; PLAN: r0=354(x), r1=215(y), r2=79(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=184(y1), r7=100(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=202(y), r12=45(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 354
LDI r1, 215
LDI r2, 79
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 184
LDI r7, 100
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 202
LDI r12, 45
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
