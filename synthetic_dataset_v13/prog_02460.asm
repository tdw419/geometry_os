; DESCRIPTION: Places a black 30x88 rectangle at position (225, 109).
; PLAN: r0=225(x), r1=109(y), r2=30(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 109
LDI r2, 30
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
