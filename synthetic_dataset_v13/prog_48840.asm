; DESCRIPTION: Composite: Places a red dot at position (48, 61) then Renders a purple disk with center (475, 100) and radius 22.
; PLAN: r0=48(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=475(x), r6=100(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 475
LDI r6, 100
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
