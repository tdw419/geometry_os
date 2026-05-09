; DESCRIPTION: Places a red 66x48 rectangle at position (179, 30).
; PLAN: r0=179(x), r1=30(y), r2=66(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 30
LDI r2, 66
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
