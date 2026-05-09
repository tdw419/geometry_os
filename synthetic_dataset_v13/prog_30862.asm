; DESCRIPTION: Places a black 13x43 rectangle at position (17, 184).
; PLAN: r0=17(x), r1=184(y), r2=13(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 184
LDI r2, 13
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
