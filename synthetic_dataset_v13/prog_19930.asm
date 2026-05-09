; DESCRIPTION: Places a black 69x23 rectangle at position (108, 128).
; PLAN: r0=108(x), r1=128(y), r2=69(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 128
LDI r2, 69
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
