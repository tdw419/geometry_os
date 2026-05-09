; DESCRIPTION: Composite: Places a magenta dot at position (302, 148) then Places a orange line segment connecting (55, 101) to (372, 153).
; PLAN: r0=302(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=101(y1), r7=372(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 55
LDI r6, 101
LDI r7, 372
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
