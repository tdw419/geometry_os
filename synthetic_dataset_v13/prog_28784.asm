; DESCRIPTION: Places a white 116x81 rectangle at position (211, 125).
; PLAN: r0=211(x), r1=125(y), r2=116(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 125
LDI r2, 116
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
