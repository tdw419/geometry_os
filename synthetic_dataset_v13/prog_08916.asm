; DESCRIPTION: Places a white 31x109 rectangle at position (141, 116).
; PLAN: r0=141(x), r1=116(y), r2=31(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 116
LDI r2, 31
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
