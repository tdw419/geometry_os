; DESCRIPTION: Composite: Renders a yellow disk with center (182, 136) and radius 29 then Sets a single cyan pixel at (168, 249).
; PLAN: r0=182(x), r1=136(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 136
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
