; DESCRIPTION: Places a black 92x17 rectangle at position (234, 37).
; PLAN: r0=234(x), r1=37(y), r2=92(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 37
LDI r2, 92
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
