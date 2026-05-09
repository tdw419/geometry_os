; DESCRIPTION: Places a red 10x12 rectangle at position (466, 183).
; PLAN: r0=466(x), r1=183(y), r2=10(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 183
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
