; DESCRIPTION: Composite: Places a magenta dot at position (22, 106) then Renders a magenta disk with center (243, 105) and radius 72.
; PLAN: r0=22(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=105(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 105
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
