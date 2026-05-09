; DESCRIPTION: Places a green 62x100 rectangle at position (336, 100).
; PLAN: r0=336(x), r1=100(y), r2=62(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 100
LDI r2, 62
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
