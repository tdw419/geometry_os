; DESCRIPTION: Places a cyan dot at position (446, 240).
; PLAN: r0=446(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
