; DESCRIPTION: Places a yellow dot at position (259, 223).
; PLAN: r0=259(x), r1=223(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 223
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
