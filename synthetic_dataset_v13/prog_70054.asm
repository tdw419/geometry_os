; DESCRIPTION: Composite: Places a black circle of radius 15 at center (42, 107) then Places a purple line segment connecting (377, 70) to (354, 120) then Places a green dot at position (131, 100).
; PLAN: r0=42(x), r1=107(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=70(y1), r7=354(x2), r8=120(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=100(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 107
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 70
LDI r7, 354
LDI r8, 120
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 100
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
