; DESCRIPTION: Composite: Draws a yellow rectangle at (100, 142) with width 78 and height 20 then Draws a green line from (170, 194) to (152, 56).
; PLAN: r0=100(x), r1=142(y), r2=78(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=194(y1), r7=152(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 142
LDI r2, 78
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 194
LDI r7, 152
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
