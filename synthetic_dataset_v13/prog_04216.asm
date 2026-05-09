; DESCRIPTION: Sets a single white pixel at (295, 241).
; PLAN: r0=295(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
