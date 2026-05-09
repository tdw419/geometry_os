; DESCRIPTION: Composite: Renders a orange disk with center (410, 69) and radius 34 then Places a orange dot at position (32, 77).
; PLAN: r0=410(x), r1=69(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=77(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 69
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 77
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
