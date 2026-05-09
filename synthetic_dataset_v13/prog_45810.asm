; DESCRIPTION: Composite: Places a magenta circle of radius 69 at center (386, 185) then Places a orange dot at position (342, 196).
; PLAN: r0=386(x), r1=185(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=196(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 185
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 196
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
