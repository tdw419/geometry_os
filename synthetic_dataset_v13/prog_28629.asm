; DESCRIPTION: Places a orange 113x83 rectangle at position (0, 116).
; PLAN: r0=0(x), r1=116(y), r2=113(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 116
LDI r2, 113
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
