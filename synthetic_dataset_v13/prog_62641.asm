; DESCRIPTION: Composite: Renders a magenta box of size 33x70 starting at (153, 113) then Draws a green line from (391, 146) to (490, 189).
; PLAN: r0=153(x), r1=113(y), r2=33(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=146(y1), r7=490(x2), r8=189(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 113
LDI r2, 33
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 146
LDI r7, 490
LDI r8, 189
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
