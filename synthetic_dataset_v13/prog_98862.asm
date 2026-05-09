; DESCRIPTION: Places a orange 75x48 rectangle at position (6, 116).
; PLAN: r0=6(x), r1=116(y), r2=75(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 116
LDI r2, 75
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
