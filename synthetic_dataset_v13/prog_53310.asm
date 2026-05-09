; DESCRIPTION: Composite: Renders a orange line between points (156, 247) and (293, 153) then Places a cyan circle of radius 69 at center (432, 184).
; PLAN: r0=156(x1), r1=247(y1), r2=293(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=184(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 247
LDI r2, 293
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 184
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
