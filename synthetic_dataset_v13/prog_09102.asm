; DESCRIPTION: Places a black 68x77 rectangle at position (423, 120).
; PLAN: r0=423(x), r1=120(y), r2=68(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 120
LDI r2, 68
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
