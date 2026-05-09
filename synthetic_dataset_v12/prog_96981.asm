; DESCRIPTION: Composite: Places a yellow dot at position (291, 148) then Renders a magenta disk with center (220, 176) and radius 39.
; PLAN: r0=291(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=176(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 291
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 220
LDI r6, 176
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
