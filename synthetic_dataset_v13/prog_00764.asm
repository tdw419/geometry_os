; DESCRIPTION: Places a black 45x18 rectangle at position (20, 69).
; PLAN: r0=20(x), r1=69(y), r2=45(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 45
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
