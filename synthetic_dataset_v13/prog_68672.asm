; DESCRIPTION: Places a white 62x85 rectangle at position (193, 33).
; PLAN: r0=193(x), r1=33(y), r2=62(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 33
LDI r2, 62
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
