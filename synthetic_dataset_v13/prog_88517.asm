; DESCRIPTION: Places a orange dot at position (256, 228).
; PLAN: r0=256(x), r1=228(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 228
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
