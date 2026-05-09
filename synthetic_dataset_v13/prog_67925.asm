; DESCRIPTION: Places a cyan dot at position (464, 193).
; PLAN: r0=464(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
