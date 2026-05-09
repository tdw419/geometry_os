; DESCRIPTION: Places a red 10x45 rectangle at position (115, 101).
; PLAN: r0=115(x), r1=101(y), r2=10(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 101
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
