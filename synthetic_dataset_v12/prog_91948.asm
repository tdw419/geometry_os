; DESCRIPTION: Composite: Renders a black box of size 25x21 starting at (461, 219) then Sets a single magenta pixel at (260, 120).
; PLAN: r0=461(x), r1=219(y), r2=25(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=120(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 219
LDI r2, 25
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 120
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
