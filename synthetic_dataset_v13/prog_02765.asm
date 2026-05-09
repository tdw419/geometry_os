; DESCRIPTION: Places a black 119x33 rectangle at position (292, 5).
; PLAN: r0=292(x), r1=5(y), r2=119(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 5
LDI r2, 119
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
