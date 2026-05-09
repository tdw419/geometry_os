; DESCRIPTION: Composite: Places a blue circle of radius 59 at center (139, 140) then Places a yellow dot at position (433, 243).
; PLAN: r0=139(x), r1=140(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=243(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 140
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 243
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
