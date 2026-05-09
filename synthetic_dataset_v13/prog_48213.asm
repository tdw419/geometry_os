; DESCRIPTION: Composite: Places a purple dot at position (14, 162) then Renders a cyan disk with center (175, 86) and radius 19.
; PLAN: r0=14(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=86(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 86
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
