; DESCRIPTION: Composite: Renders a cyan line between points (222, 251) and (56, 28) then Sets a single magenta pixel at (456, 148).
; PLAN: r0=222(x1), r1=251(y1), r2=56(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=148(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 251
LDI r2, 56
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 148
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
