; DESCRIPTION: Places a cyan dot at position (220, 21).
; PLAN: r0=220(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
