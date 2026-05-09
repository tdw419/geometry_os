; DESCRIPTION: Places a yellow dot at position (387, 249).
; PLAN: r0=387(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 387
LDI r1, 249
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
