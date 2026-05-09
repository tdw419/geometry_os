; DESCRIPTION: Places a white dot at position (294, 244).
; PLAN: r0=294(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 294
LDI r1, 244
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
