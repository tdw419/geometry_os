; DESCRIPTION: Composite: Renders a yellow box of size 83x52 starting at (273, 86) then Sets a single magenta pixel at (444, 222).
; PLAN: r0=273(x), r1=86(y), r2=83(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=222(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 86
LDI r2, 83
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 222
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
