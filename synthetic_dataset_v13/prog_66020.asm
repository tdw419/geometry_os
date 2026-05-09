; DESCRIPTION: Composite: Places a red dot at position (5, 187) then Renders a yellow disk with center (120, 96) and radius 77.
; PLAN: r0=5(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=96(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 120
LDI r6, 96
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
