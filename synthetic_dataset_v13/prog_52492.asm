; DESCRIPTION: Places a black 20x119 rectangle at position (342, 11).
; PLAN: r0=342(x), r1=11(y), r2=20(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 11
LDI r2, 20
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
