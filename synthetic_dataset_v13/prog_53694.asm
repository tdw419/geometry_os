; DESCRIPTION: Composite: Renders a black disk with center (218, 69) and radius 63 then Sets a single cyan pixel at (489, 46).
; PLAN: r0=218(x), r1=69(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=46(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 69
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 46
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
