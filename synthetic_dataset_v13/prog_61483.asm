; DESCRIPTION: Places a blue 83x24 rectangle at position (326, 184).
; PLAN: r0=326(x), r1=184(y), r2=83(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 184
LDI r2, 83
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
