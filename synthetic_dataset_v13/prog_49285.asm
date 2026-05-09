; DESCRIPTION: Sets a single white pixel at (284, 29).
; PLAN: r0=284(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
