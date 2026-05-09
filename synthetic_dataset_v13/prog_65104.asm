; DESCRIPTION: Places a yellow 21x103 rectangle at position (473, 136).
; PLAN: r0=473(x), r1=136(y), r2=21(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 136
LDI r2, 21
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
