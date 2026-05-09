; DESCRIPTION: Composite: Draws a yellow circle centered at (109, 120) with radius 70 then Sets a single white pixel at (440, 125).
; PLAN: r0=109(x), r1=120(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=125(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 120
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 125
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
