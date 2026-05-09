; DESCRIPTION: Places a cyan dot at position (453, 92).
; PLAN: r0=453(x), r1=92(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 92
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
