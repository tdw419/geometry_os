; DESCRIPTION: Composite: Places a black line segment connecting (218, 176) to (306, 183) then Renders a black box of size 73x109 starting at (401, 122) then Sets a single white pixel at (381, 163).
; PLAN: r0=218(x1), r1=176(y1), r2=306(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=122(y), r7=73(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x), r11=163(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 176
LDI r2, 306
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 122
LDI r7, 73
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 163
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
