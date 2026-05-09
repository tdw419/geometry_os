; DESCRIPTION: Places a yellow 33x88 rectangle at position (94, 8).
; PLAN: r0=94(x), r1=8(y), r2=33(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 8
LDI r2, 33
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
