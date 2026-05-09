; DESCRIPTION: Places a cyan dot at position (70, 125).
; PLAN: r0=70(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
