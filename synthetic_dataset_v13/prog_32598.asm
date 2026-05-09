; DESCRIPTION: Composite: Sets a single orange pixel at (243, 54) then Places a black circle of radius 79 at center (115, 168).
; PLAN: r0=243(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=168(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 115
LDI r6, 168
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
