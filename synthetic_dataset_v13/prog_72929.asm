; DESCRIPTION: Composite: Renders a blue disk with center (482, 35) and radius 15 then Places a blue dot at position (236, 59).
; PLAN: r0=482(x), r1=35(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 35
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
