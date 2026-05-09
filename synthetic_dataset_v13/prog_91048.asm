; DESCRIPTION: Sets a single green pixel at (168, 59).
; PLAN: r0=168(x), r1=59(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 59
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
