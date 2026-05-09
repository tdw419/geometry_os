; DESCRIPTION: Composite: Renders a yellow disk with center (340, 146) and radius 33 then Places a orange dot at position (165, 5).
; PLAN: r0=340(x), r1=146(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 146
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
