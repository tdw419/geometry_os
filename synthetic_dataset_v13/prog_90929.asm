; DESCRIPTION: Composite: Places a red dot at position (216, 144) then Places a green circle of radius 55 at center (79, 172).
; PLAN: r0=216(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=172(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 79
LDI r6, 172
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
