; DESCRIPTION: Places a black 92x37 rectangle at position (261, 47).
; PLAN: r0=261(x), r1=47(y), r2=92(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 47
LDI r2, 92
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
