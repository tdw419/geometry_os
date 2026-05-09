; DESCRIPTION: Sets a single white pixel at (502, 210).
; PLAN: r0=502(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
