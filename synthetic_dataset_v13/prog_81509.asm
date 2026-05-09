; DESCRIPTION: Places a yellow dot at position (103, 152).
; PLAN: r0=103(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
