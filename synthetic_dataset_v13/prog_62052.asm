; DESCRIPTION: Places a white 103x50 rectangle at position (270, 116).
; PLAN: r0=270(x), r1=116(y), r2=103(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 116
LDI r2, 103
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
