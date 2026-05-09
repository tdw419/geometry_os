; DESCRIPTION: Composite: Draws a magenta circle centered at (155, 161) with radius 46 then Sets a single cyan pixel at (473, 197).
; PLAN: r0=155(x), r1=161(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=197(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 161
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 197
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
