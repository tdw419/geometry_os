; DESCRIPTION: Places a black 62x92 rectangle at position (186, 110).
; PLAN: r0=186(x), r1=110(y), r2=62(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 110
LDI r2, 62
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
