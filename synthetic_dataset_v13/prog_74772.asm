; DESCRIPTION: Composite: Draws a cyan line from (21, 177) to (489, 33) then Creates a magenta circular shape at (155, 159) with radius 59.
; PLAN: r0=21(x1), r1=177(y1), r2=489(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=159(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 177
LDI r2, 489
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 159
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
