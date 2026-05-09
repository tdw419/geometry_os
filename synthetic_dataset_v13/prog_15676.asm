; DESCRIPTION: Places a white 85x72 rectangle at position (248, 53).
; PLAN: r0=248(x), r1=53(y), r2=85(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 53
LDI r2, 85
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
