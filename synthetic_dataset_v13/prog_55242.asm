; DESCRIPTION: Places a blue dot at position (479, 127).
; PLAN: r0=479(x), r1=127(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 127
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
