; DESCRIPTION: Composite: Renders a magenta disk with center (135, 54) and radius 36 then Places a orange dot at position (97, 36).
; PLAN: r0=135(x), r1=54(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=36(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 54
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 36
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
