; DESCRIPTION: Places a black 117x77 rectangle at position (52, 133).
; PLAN: r0=52(x), r1=133(y), r2=117(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 133
LDI r2, 117
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
