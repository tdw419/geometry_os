; DESCRIPTION: Places a black 48x10 rectangle at position (361, 69).
; PLAN: r0=361(x), r1=69(y), r2=48(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 69
LDI r2, 48
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
