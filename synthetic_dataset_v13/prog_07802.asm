; DESCRIPTION: Composite: Places a magenta dot at position (250, 218) then Renders a blue disk with center (412, 122) and radius 73.
; PLAN: r0=250(x), r1=218(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=122(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 218
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 122
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
