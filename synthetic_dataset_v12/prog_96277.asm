; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (288, 216) then Sets a single magenta pixel at (385, 226).
; PLAN: r0=288(x), r1=216(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=226(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 216
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 226
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
