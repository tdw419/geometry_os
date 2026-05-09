; DESCRIPTION: Places a white 31x72 rectangle at position (120, 54).
; PLAN: r0=120(x), r1=54(y), r2=31(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 54
LDI r2, 31
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
