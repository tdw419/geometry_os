; DESCRIPTION: Places a red dot at position (470, 149).
; PLAN: r0=470(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
