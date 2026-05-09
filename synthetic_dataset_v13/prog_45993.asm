; DESCRIPTION: Places a orange dot at position (146, 128).
; PLAN: r0=146(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
