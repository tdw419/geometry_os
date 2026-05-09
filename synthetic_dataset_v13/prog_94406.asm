; DESCRIPTION: Composite: Renders a magenta disk with center (223, 125) and radius 15 then Places a red dot at position (302, 29).
; PLAN: r0=223(x), r1=125(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=29(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 125
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 29
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
