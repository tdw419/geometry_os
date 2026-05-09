; DESCRIPTION: Places a red dot at position (197, 228).
; PLAN: r0=197(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
