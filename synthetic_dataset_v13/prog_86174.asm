; DESCRIPTION: Composite: Sets a single magenta pixel at (91, 55) then Places a cyan circle of radius 58 at center (277, 90).
; PLAN: r0=91(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=90(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 90
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
