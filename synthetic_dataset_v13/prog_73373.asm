; DESCRIPTION: Sets a single white pixel at (295, 148).
; PLAN: r0=295(x), r1=148(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 148
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
