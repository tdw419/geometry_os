; DESCRIPTION: Places a orange 87x29 rectangle at position (360, 116).
; PLAN: r0=360(x), r1=116(y), r2=87(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 116
LDI r2, 87
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
