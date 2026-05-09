; DESCRIPTION: Composite: Places a purple line segment connecting (234, 120) to (298, 87) then Places a cyan circle of radius 73 at center (330, 93) then Sets a single magenta pixel at (449, 164).
; PLAN: r0=234(x1), r1=120(y1), r2=298(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=93(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=449(x), r11=164(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 234
LDI r1, 120
LDI r2, 298
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 93
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 449
LDI r11, 164
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
