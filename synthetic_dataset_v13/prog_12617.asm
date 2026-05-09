; DESCRIPTION: Composite: Sets a single purple pixel at (27, 229) then Places a green circle of radius 13 at center (117, 103).
; PLAN: r0=27(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=103(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 103
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
