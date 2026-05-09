; DESCRIPTION: Places a cyan dot at position (403, 244).
; PLAN: r0=403(x), r1=244(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 244
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
