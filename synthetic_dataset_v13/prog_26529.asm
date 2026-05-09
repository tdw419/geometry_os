; DESCRIPTION: Composite: Draws a black line from (130, 57) to (138, 26) then Renders a magenta box of size 83x17 starting at (160, 58).
; PLAN: r0=130(x1), r1=57(y1), r2=138(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=58(y), r7=83(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 57
LDI r2, 138
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 58
LDI r7, 83
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
