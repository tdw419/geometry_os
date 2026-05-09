; DESCRIPTION: Places a blue dot at position (443, 166).
; PLAN: r0=443(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 443
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
