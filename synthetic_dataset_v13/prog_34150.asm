; DESCRIPTION: Composite: Places a yellow dot at position (191, 228) then Renders a blue disk with center (44, 132) and radius 30.
; PLAN: r0=191(x), r1=228(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=132(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 228
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 44
LDI r6, 132
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
