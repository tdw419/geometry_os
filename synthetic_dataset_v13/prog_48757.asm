; DESCRIPTION: Places a black 52x24 rectangle at position (143, 124).
; PLAN: r0=143(x), r1=124(y), r2=52(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 124
LDI r2, 52
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
