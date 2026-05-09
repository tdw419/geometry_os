; DESCRIPTION: Composite: Sets a single white pixel at (355, 251) then Renders a orange box of size 86x39 starting at (214, 88) then Places a yellow line segment connecting (221, 234) to (98, 48).
; PLAN: r0=355(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=88(y), r7=86(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=234(y1), r12=98(x2), r13=48(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 88
LDI r7, 86
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 234
LDI r12, 98
LDI r13, 48
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
