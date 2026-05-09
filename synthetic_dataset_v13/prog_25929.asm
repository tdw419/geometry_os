; DESCRIPTION: Sets a single white pixel at (404, 95).
; PLAN: r0=404(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
