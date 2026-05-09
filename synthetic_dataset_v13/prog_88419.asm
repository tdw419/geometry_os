; DESCRIPTION: Places a orange 116x28 rectangle at position (196, 223).
; PLAN: r0=196(x), r1=223(y), r2=116(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 223
LDI r2, 116
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
