; DESCRIPTION: Places a yellow dot at position (214, 239).
; PLAN: r0=214(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
