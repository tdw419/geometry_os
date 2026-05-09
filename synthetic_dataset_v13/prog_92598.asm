; DESCRIPTION: Places a cyan dot at position (38, 184).
; PLAN: r0=38(x), r1=184(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 184
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
