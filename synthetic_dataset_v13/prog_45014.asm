; DESCRIPTION: Composite: Renders a yellow disk with center (212, 161) and radius 48 then Places a white dot at position (435, 152).
; PLAN: r0=212(x), r1=161(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=152(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 161
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 152
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
