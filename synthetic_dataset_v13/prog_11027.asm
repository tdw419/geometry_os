; DESCRIPTION: Composite: Draws a red circle centered at (275, 154) with radius 62 then Sets a single blue pixel at (446, 205).
; PLAN: r0=275(x), r1=154(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=205(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 154
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 205
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
