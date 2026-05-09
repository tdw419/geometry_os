; DESCRIPTION: Places a white 67x82 rectangle at position (150, 116).
; PLAN: r0=150(x), r1=116(y), r2=67(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 116
LDI r2, 67
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
