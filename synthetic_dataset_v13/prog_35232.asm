; DESCRIPTION: Composite: Places a green dot at position (339, 149) then Draws a black circle centered at (99, 193) with radius 61.
; PLAN: r0=339(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=193(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 99
LDI r6, 193
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
