; DESCRIPTION: Composite: Places a red dot at position (500, 149) then Places a green circle of radius 29 at center (180, 124).
; PLAN: r0=500(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=124(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 180
LDI r6, 124
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
