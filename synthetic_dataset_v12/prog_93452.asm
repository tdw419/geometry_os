; DESCRIPTION: Composite: Draws a yellow circle centered at (283, 138) with radius 22 then Places a yellow dot at position (123, 14).
; PLAN: r0=283(x), r1=138(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=14(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 138
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 14
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
