; DESCRIPTION: Places a black 101x92 rectangle at position (10, 164).
; PLAN: r0=10(x), r1=164(y), r2=101(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 164
LDI r2, 101
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
