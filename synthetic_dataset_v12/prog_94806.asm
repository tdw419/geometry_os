; DESCRIPTION: Places a black 100x92 rectangle at position (117, 55).
; PLAN: r0=117(x), r1=55(y), r2=100(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 55
LDI r2, 100
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
