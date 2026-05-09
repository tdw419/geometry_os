; DESCRIPTION: Places a white 116x60 rectangle at position (274, 63).
; PLAN: r0=274(x), r1=63(y), r2=116(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 63
LDI r2, 116
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
