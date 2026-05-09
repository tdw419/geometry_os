; DESCRIPTION: Composite: Renders a cyan disk with center (403, 155) and radius 16 then Sets a single cyan pixel at (111, 222).
; PLAN: r0=403(x), r1=155(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 155
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
