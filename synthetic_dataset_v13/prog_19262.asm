; DESCRIPTION: Composite: Places a yellow dot at position (304, 170) then Renders a black line between points (73, 72) and (81, 76) then Renders a red box of size 115x40 starting at (99, 76).
; PLAN: r0=304(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=72(y1), r7=81(x2), r8=76(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=76(y), r12=115(width), r13=40(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 73
LDI r6, 72
LDI r7, 81
LDI r8, 76
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 76
LDI r12, 115
LDI r13, 40
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
