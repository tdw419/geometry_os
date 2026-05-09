; DESCRIPTION: Places a white 110x102 rectangle at position (271, 116).
; PLAN: r0=271(x), r1=116(y), r2=110(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 116
LDI r2, 110
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
