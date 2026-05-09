; DESCRIPTION: Places a black 95x20 rectangle at position (45, 75).
; PLAN: r0=45(x), r1=75(y), r2=95(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 75
LDI r2, 95
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
