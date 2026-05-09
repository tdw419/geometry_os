; DESCRIPTION: Places a cyan dot at position (369, 14).
; PLAN: r0=369(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
