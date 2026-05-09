; DESCRIPTION: Places a green 62x60 rectangle at position (141, 150).
; PLAN: r0=141(x), r1=150(y), r2=62(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 150
LDI r2, 62
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
