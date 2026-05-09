; DESCRIPTION: Composite: Renders a cyan disk with center (469, 143) and radius 36 then Places a green dot at position (385, 220).
; PLAN: r0=469(x), r1=143(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 469
LDI r1, 143
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
