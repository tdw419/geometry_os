; DESCRIPTION: Places a black 85x95 rectangle at position (292, 20).
; PLAN: r0=292(x), r1=20(y), r2=85(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 20
LDI r2, 85
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
