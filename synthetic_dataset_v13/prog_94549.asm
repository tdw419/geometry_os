; DESCRIPTION: Composite: Renders a red line between points (288, 170) and (109, 195) then Renders a black box of size 80x58 starting at (261, 132).
; PLAN: r0=288(x1), r1=170(y1), r2=109(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=132(y), r7=80(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 170
LDI r2, 109
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 132
LDI r7, 80
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
