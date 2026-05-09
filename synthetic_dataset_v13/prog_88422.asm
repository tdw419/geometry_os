; DESCRIPTION: Composite: Renders a magenta disk with center (195, 178) and radius 50 then Places a red dot at position (195, 226).
; PLAN: r0=195(x), r1=178(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=226(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 178
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 226
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
