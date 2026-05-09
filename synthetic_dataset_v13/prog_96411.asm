; DESCRIPTION: Sets a single magenta pixel at (479, 248).
; PLAN: r0=479(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 248
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
