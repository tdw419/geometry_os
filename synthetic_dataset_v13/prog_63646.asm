; DESCRIPTION: Places a blue 53x71 rectangle at position (169, 128).
; PLAN: r0=169(x), r1=128(y), r2=53(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 128
LDI r2, 53
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
