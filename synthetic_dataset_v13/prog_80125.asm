; DESCRIPTION: Composite: Places a blue dot at position (30, 87) then Renders a purple disk with center (465, 124) and radius 38.
; PLAN: r0=30(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=465(x), r6=124(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 465
LDI r6, 124
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
