; DESCRIPTION: Composite: Renders a blue disk with center (161, 140) and radius 25 then Places a cyan dot at position (482, 197).
; PLAN: r0=161(x), r1=140(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=197(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 140
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 197
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
