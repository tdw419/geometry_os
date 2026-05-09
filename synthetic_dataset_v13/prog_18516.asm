; DESCRIPTION: Composite: Renders a cyan disk with center (60, 136) and radius 54 then Places a yellow dot at position (39, 119).
; PLAN: r0=60(x), r1=136(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=119(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 136
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 119
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
