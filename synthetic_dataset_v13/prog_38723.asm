; DESCRIPTION: Places a black 92x25 rectangle at position (102, 219).
; PLAN: r0=102(x), r1=219(y), r2=92(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 219
LDI r2, 92
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
