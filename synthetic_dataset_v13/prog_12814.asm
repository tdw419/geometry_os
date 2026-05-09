; DESCRIPTION: Composite: Creates a blue rectangular region at (110, 58) spanning 12 by 27 pixels then Draws a black line from (127, 146) to (86, 11).
; PLAN: r0=110(x), r1=58(y), r2=12(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x1), r6=146(y1), r7=86(x2), r8=11(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 58
LDI r2, 12
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 146
LDI r7, 86
LDI r8, 11
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
