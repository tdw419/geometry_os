; DESCRIPTION: Places a white 116x26 rectangle at position (376, 133).
; PLAN: r0=376(x), r1=133(y), r2=116(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 133
LDI r2, 116
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
