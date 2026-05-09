; DESCRIPTION: Places a cyan dot at position (45, 228).
; PLAN: r0=45(x), r1=228(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 228
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
