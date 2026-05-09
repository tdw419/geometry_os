; DESCRIPTION: Places a black 69x31 rectangle at position (286, 12).
; PLAN: r0=286(x), r1=12(y), r2=69(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 12
LDI r2, 69
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
