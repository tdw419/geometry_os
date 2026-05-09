; DESCRIPTION: Composite: Places a yellow dot at position (484, 23) then Renders a magenta disk with center (405, 130) and radius 62.
; PLAN: r0=484(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=130(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 130
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
