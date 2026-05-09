; DESCRIPTION: Places a black 59x23 rectangle at position (16, 188).
; PLAN: r0=16(x), r1=188(y), r2=59(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 188
LDI r2, 59
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
