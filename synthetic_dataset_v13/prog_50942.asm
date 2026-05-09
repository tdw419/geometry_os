; DESCRIPTION: Places a yellow dot at position (220, 242).
; PLAN: r0=220(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
