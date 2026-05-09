; DESCRIPTION: Places a cyan dot at position (108, 50).
; PLAN: r0=108(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
