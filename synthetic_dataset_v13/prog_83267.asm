; DESCRIPTION: Places a white 85x57 rectangle at position (12, 64).
; PLAN: r0=12(x), r1=64(y), r2=85(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 85
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
