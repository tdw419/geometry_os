; DESCRIPTION: Places a black 61x13 rectangle at position (250, 92).
; PLAN: r0=250(x), r1=92(y), r2=61(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 92
LDI r2, 61
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
