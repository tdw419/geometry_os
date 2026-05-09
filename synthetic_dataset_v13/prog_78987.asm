; DESCRIPTION: Composite: Places a white circle of radius 27 at center (312, 120) then Sets a single white pixel at (42, 33).
; PLAN: r0=312(x), r1=120(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=33(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 120
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 33
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
