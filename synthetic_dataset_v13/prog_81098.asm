; DESCRIPTION: Places a white 116x120 rectangle at position (241, 24).
; PLAN: r0=241(x), r1=24(y), r2=116(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 24
LDI r2, 116
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
