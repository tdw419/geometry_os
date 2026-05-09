; DESCRIPTION: Places a black 58x79 rectangle at position (203, 100).
; PLAN: r0=203(x), r1=100(y), r2=58(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 100
LDI r2, 58
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
