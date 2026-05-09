; DESCRIPTION: Composite: Draws a red circle centered at (319, 94) with radius 40 then Places a yellow dot at position (430, 243).
; PLAN: r0=319(x), r1=94(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=243(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 94
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 243
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
