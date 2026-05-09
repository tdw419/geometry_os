; DESCRIPTION: Places a orange 110x73 rectangle at position (168, 116).
; PLAN: r0=168(x), r1=116(y), r2=110(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 116
LDI r2, 110
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
