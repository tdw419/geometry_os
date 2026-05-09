; DESCRIPTION: Places a yellow 21x84 rectangle at position (423, 88).
; PLAN: r0=423(x), r1=88(y), r2=21(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 88
LDI r2, 21
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
