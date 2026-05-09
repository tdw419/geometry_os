; DESCRIPTION: Places a white 52x66 rectangle at position (228, 82).
; PLAN: r0=228(x), r1=82(y), r2=52(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 82
LDI r2, 52
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
