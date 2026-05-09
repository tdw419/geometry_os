; DESCRIPTION: Places a green dot at position (410, 185).
; PLAN: r0=410(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 410
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
