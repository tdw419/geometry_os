; DESCRIPTION: Places a yellow dot at position (205, 243).
; PLAN: r0=205(x), r1=243(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 243
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
