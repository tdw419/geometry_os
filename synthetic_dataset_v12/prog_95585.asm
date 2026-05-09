; DESCRIPTION: Composite: Places a purple dot at position (231, 149) then Places a yellow circle of radius 78 at center (150, 101).
; PLAN: r0=231(x), r1=149(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=101(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 149
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 101
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
