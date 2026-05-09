; DESCRIPTION: Places a yellow 66x61 rectangle at position (85, 183).
; PLAN: r0=85(x), r1=183(y), r2=66(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 183
LDI r2, 66
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
