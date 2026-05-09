; DESCRIPTION: Places a cyan dot at position (243, 244).
; PLAN: r0=243(x), r1=244(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 244
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
