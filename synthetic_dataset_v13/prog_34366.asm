; DESCRIPTION: Places a blue 62x22 rectangle at position (245, 90).
; PLAN: r0=245(x), r1=90(y), r2=62(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 90
LDI r2, 62
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
