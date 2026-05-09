; DESCRIPTION: Places a black 38x34 rectangle at position (442, 72).
; PLAN: r0=442(x), r1=72(y), r2=38(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 72
LDI r2, 38
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
