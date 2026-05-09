; DESCRIPTION: Composite: Places a yellow dot at position (217, 202) then Creates a blue circular shape at (207, 115) with radius 70.
; PLAN: r0=217(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=115(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 115
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
