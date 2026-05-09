; DESCRIPTION: Places a cyan dot at position (69, 206).
; PLAN: r0=69(x), r1=206(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 206
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
