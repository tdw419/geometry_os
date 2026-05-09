; DESCRIPTION: Places a white 116x76 rectangle at position (172, 12).
; PLAN: r0=172(x), r1=12(y), r2=116(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 12
LDI r2, 116
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
