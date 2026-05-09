; DESCRIPTION: Places a white 116x55 rectangle at position (234, 142).
; PLAN: r0=234(x), r1=142(y), r2=116(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 142
LDI r2, 116
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
