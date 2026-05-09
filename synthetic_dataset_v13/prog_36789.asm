; DESCRIPTION: Places a black 13x70 rectangle at position (13, 12).
; PLAN: r0=13(x), r1=12(y), r2=13(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 12
LDI r2, 13
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
