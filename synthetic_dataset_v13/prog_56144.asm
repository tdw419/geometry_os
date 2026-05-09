; DESCRIPTION: Composite: Places a green dot at position (493, 144) then Renders a cyan disk with center (370, 43) and radius 39.
; PLAN: r0=493(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=43(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 370
LDI r6, 43
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
