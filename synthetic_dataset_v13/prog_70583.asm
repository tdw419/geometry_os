; DESCRIPTION: Places a yellow 66x88 rectangle at position (3, 16).
; PLAN: r0=3(x), r1=16(y), r2=66(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 16
LDI r2, 66
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
