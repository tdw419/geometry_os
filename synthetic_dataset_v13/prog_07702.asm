; DESCRIPTION: Places a yellow 79x101 rectangle at position (397, 152).
; PLAN: r0=397(x), r1=152(y), r2=79(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 152
LDI r2, 79
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
