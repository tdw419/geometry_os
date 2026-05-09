; DESCRIPTION: Places a magenta dot at position (398, 83).
; PLAN: r0=398(x), r1=83(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 83
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
