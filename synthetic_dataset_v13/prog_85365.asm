; DESCRIPTION: Places a orange 73x10 rectangle at position (354, 189).
; PLAN: r0=354(x), r1=189(y), r2=73(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 189
LDI r2, 73
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
