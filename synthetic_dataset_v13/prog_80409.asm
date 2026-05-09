; DESCRIPTION: Places a blue 38x108 rectangle at position (189, 112).
; PLAN: r0=189(x), r1=112(y), r2=38(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 112
LDI r2, 38
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
