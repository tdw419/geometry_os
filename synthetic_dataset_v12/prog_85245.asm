; DESCRIPTION: Places a orange 88x76 rectangle at position (186, 116).
; PLAN: r0=186(x), r1=116(y), r2=88(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 116
LDI r2, 88
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
