; DESCRIPTION: Places a green 20x62 rectangle at position (412, 31).
; PLAN: r0=412(x), r1=31(y), r2=20(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 31
LDI r2, 20
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
