; DESCRIPTION: Composite: Renders a purple box of size 23x86 starting at (406, 78) then Sets a single red pixel at (407, 39) then Renders a red line between points (329, 206) and (339, 160).
; PLAN: r0=406(x), r1=78(y), r2=23(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=329(x1), r11=206(y1), r12=339(x2), r13=160(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 78
LDI r2, 23
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 329
LDI r11, 206
LDI r12, 339
LDI r13, 160
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
