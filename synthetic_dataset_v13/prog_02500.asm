; DESCRIPTION: Composite: Renders a black disk with center (295, 63) and radius 19 then Places a green dot at position (92, 213).
; PLAN: r0=295(x), r1=63(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 63
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
