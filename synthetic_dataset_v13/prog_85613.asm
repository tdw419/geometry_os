; DESCRIPTION: Composite: Places a red line segment connecting (342, 162) to (130, 247) then Creates a magenta circular shape at (193, 164) with radius 69.
; PLAN: r0=342(x1), r1=162(y1), r2=130(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=164(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 162
LDI r2, 130
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 164
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
