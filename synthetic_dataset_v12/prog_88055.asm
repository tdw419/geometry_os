; DESCRIPTION: Places a cyan dot at position (240, 186).
; PLAN: r0=240(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
