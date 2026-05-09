; DESCRIPTION: Composite: Sets a single purple pixel at (268, 226) then Places a green circle of radius 37 at center (146, 196).
; PLAN: r0=268(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=196(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 196
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
