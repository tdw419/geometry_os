; DESCRIPTION: Places a cyan dot at position (317, 243).
; PLAN: r0=317(x), r1=243(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 243
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
