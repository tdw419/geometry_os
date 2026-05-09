; DESCRIPTION: Places a green 60x101 rectangle at position (403, 88).
; PLAN: r0=403(x), r1=88(y), r2=60(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 88
LDI r2, 60
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
