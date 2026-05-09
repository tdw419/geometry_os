; DESCRIPTION: Composite: Places a white dot at position (113, 55) then Renders a blue disk with center (292, 100) and radius 80.
; PLAN: r0=113(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=100(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 100
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
