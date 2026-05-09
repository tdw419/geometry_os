; DESCRIPTION: Places a black 92x11 rectangle at position (376, 137).
; PLAN: r0=376(x), r1=137(y), r2=92(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 137
LDI r2, 92
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
