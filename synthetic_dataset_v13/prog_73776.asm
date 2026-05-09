; DESCRIPTION: Composite: Renders a red disk with center (456, 132) and radius 38 then Sets a single cyan pixel at (37, 115).
; PLAN: r0=456(x), r1=132(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 132
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
