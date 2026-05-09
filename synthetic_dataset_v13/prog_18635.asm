; DESCRIPTION: Places a orange 17x36 rectangle at position (469, 103).
; PLAN: r0=469(x), r1=103(y), r2=17(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 103
LDI r2, 17
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
