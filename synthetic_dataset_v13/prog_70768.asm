; DESCRIPTION: Composite: Renders a black box of size 32x57 starting at (302, 99) then Sets a single magenta pixel at (122, 60).
; PLAN: r0=302(x), r1=99(y), r2=32(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=60(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 99
LDI r2, 32
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 60
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
