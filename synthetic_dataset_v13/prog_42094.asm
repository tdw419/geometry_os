; DESCRIPTION: Places a yellow 37x10 rectangle at position (163, 133).
; PLAN: r0=163(x), r1=133(y), r2=37(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 133
LDI r2, 37
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
