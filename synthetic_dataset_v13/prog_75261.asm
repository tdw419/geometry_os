; DESCRIPTION: Composite: Creates a magenta rectangular region at (10, 63) spanning 73 by 95 pixels then Renders a purple line between points (450, 122) and (410, 250) then Places a magenta circle of radius 77 at center (105, 83).
; PLAN: r0=10(x), r1=63(y), r2=73(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=122(y1), r7=410(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=83(y), r12=77(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 63
LDI r2, 73
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 122
LDI r7, 410
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 83
LDI r12, 77
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
