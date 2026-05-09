; DESCRIPTION: Composite: Draws a magenta line from (467, 55) to (183, 95) then Creates a red circular shape at (220, 69) with radius 22.
; PLAN: r0=467(x1), r1=55(y1), r2=183(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=69(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 467
LDI r1, 55
LDI r2, 183
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 69
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
