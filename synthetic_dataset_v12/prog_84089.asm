; DESCRIPTION: Composite: Places a green circle of radius 58 at center (152, 80) then Places a green dot at position (93, 126).
; PLAN: r0=152(x), r1=80(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=126(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 80
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 126
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
