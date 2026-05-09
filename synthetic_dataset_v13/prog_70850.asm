; DESCRIPTION: Composite: Places a green dot at position (135, 207) then Renders a blue disk with center (124, 151) and radius 12.
; PLAN: r0=135(x), r1=207(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=151(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 207
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 151
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
