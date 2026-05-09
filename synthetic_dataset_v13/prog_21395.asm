; DESCRIPTION: Composite: Places a magenta line segment connecting (110, 162) to (33, 195) then Draws a magenta circle centered at (380, 209) with radius 29.
; PLAN: r0=110(x1), r1=162(y1), r2=33(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=209(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 162
LDI r2, 33
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 209
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
