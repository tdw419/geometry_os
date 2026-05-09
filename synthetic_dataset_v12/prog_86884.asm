; DESCRIPTION: Places a white 78x42 rectangle at position (66, 120).
; PLAN: r0=66(x), r1=120(y), r2=78(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 120
LDI r2, 78
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
