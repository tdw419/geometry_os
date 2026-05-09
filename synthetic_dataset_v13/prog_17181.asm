; DESCRIPTION: Places a green 62x36 rectangle at position (287, 142).
; PLAN: r0=287(x), r1=142(y), r2=62(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 142
LDI r2, 62
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
