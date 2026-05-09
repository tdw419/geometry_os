; DESCRIPTION: Places a white 120x83 rectangle at position (76, 52).
; PLAN: r0=76(x), r1=52(y), r2=120(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 52
LDI r2, 120
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
