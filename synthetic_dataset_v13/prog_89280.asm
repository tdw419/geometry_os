; DESCRIPTION: Places a black 109x35 rectangle at position (223, 181).
; PLAN: r0=223(x), r1=181(y), r2=109(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 181
LDI r2, 109
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
