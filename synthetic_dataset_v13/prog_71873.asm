; DESCRIPTION: Places a white 120x13 rectangle at position (115, 85).
; PLAN: r0=115(x), r1=85(y), r2=120(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 85
LDI r2, 120
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
