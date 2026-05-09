; DESCRIPTION: Places a red 31x61 rectangle at position (471, 168).
; PLAN: r0=471(x), r1=168(y), r2=31(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 168
LDI r2, 31
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
