; DESCRIPTION: Places a white 87x97 rectangle at position (228, 28).
; PLAN: r0=228(x), r1=28(y), r2=87(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 28
LDI r2, 87
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
