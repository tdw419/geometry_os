; DESCRIPTION: Places a black 24x89 rectangle at position (48, 11).
; PLAN: r0=48(x), r1=11(y), r2=24(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 11
LDI r2, 24
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
