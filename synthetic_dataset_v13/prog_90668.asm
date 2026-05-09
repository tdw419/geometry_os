; DESCRIPTION: Places a white 109x74 rectangle at position (26, 14).
; PLAN: r0=26(x), r1=14(y), r2=109(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 14
LDI r2, 109
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
