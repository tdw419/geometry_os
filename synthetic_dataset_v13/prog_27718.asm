; DESCRIPTION: Composite: Places a purple dot at position (509, 197) then Places a green circle of radius 78 at center (229, 103).
; PLAN: r0=509(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=103(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 103
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
