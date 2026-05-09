; DESCRIPTION: Places a cyan dot at position (136, 215).
; PLAN: r0=136(x), r1=215(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 215
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
