; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (152, 99) then Places a white dot at position (248, 96).
; PLAN: r0=152(x), r1=99(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 99
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
