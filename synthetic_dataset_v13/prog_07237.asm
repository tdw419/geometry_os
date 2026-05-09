; DESCRIPTION: Places a orange 88x58 rectangle at position (165, 197).
; PLAN: r0=165(x), r1=197(y), r2=88(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 197
LDI r2, 88
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
