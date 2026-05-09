; DESCRIPTION: Composite: Places a magenta dot at position (8, 50) then Renders a white disk with center (192, 158) and radius 59.
; PLAN: r0=8(x), r1=50(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=158(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 50
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 158
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
