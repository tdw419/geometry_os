; DESCRIPTION: Composite: Draws a white circle centered at (334, 125) with radius 20 then Places a red dot at position (425, 117).
; PLAN: r0=334(x), r1=125(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=117(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 125
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 117
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
