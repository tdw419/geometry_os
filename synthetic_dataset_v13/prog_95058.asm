; DESCRIPTION: Places a black 92x100 rectangle at position (248, 91).
; PLAN: r0=248(x), r1=91(y), r2=92(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 91
LDI r2, 92
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
