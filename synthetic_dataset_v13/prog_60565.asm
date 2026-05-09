; DESCRIPTION: Places a green 82x108 rectangle at position (216, 136).
; PLAN: r0=216(x), r1=136(y), r2=82(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 136
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
