; DESCRIPTION: Places a white 57x95 rectangle at position (354, 85).
; PLAN: r0=354(x), r1=85(y), r2=57(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 85
LDI r2, 57
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
