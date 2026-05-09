; DESCRIPTION: Places a magenta dot at position (174, 236).
; PLAN: r0=174(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
