; DESCRIPTION: Places a green 57x108 rectangle at position (28, 133).
; PLAN: r0=28(x), r1=133(y), r2=57(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 133
LDI r2, 57
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
