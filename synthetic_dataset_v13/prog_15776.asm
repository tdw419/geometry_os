; DESCRIPTION: Places a red 87x38 rectangle at position (66, 109).
; PLAN: r0=66(x), r1=109(y), r2=87(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 109
LDI r2, 87
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
