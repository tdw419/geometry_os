; DESCRIPTION: Places a orange 100x32 rectangle at position (165, 81).
; PLAN: r0=165(x), r1=81(y), r2=100(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 81
LDI r2, 100
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
