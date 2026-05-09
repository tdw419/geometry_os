; DESCRIPTION: Composite: Creates a black circular shape at (277, 148) with radius 69 then Places a cyan dot at position (187, 212).
; PLAN: r0=277(x), r1=148(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 148
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
