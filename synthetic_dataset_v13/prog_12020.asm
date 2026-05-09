; DESCRIPTION: Places a orange 53x37 rectangle at position (92, 8).
; PLAN: r0=92(x), r1=8(y), r2=53(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 8
LDI r2, 53
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
