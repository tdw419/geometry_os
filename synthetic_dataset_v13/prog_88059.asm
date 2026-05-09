; DESCRIPTION: Composite: Renders a blue line between points (112, 146) and (286, 234) then Draws a orange rectangle at (276, 127) with width 65 and height 18.
; PLAN: r0=112(x1), r1=146(y1), r2=286(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=127(y), r7=65(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 146
LDI r2, 286
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 127
LDI r7, 65
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
