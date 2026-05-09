; DESCRIPTION: Places a green dot at position (108, 180).
; PLAN: r0=108(x), r1=180(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 180
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
