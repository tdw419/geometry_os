; DESCRIPTION: Places a black 35x91 rectangle at position (358, 69).
; PLAN: r0=358(x), r1=69(y), r2=35(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 69
LDI r2, 35
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
