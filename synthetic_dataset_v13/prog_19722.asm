; DESCRIPTION: Places a cyan dot at position (273, 117).
; PLAN: r0=273(x), r1=117(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 117
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
