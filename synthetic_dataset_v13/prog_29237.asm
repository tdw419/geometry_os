; DESCRIPTION: Places a red dot at position (502, 246).
; PLAN: r0=502(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
