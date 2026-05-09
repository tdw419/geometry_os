; DESCRIPTION: Sets a single white pixel at (305, 180).
; PLAN: r0=305(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 180
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
