; DESCRIPTION: Places a orange 14x17 rectangle at position (476, 99).
; PLAN: r0=476(x), r1=99(y), r2=14(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 99
LDI r2, 14
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
