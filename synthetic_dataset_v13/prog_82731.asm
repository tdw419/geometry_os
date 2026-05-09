; DESCRIPTION: Composite: Places a white dot at position (121, 125) then Places a orange circle of radius 74 at center (218, 93).
; PLAN: r0=121(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=93(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 93
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
