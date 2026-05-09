; DESCRIPTION: Places a cyan dot at position (416, 138).
; PLAN: r0=416(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
