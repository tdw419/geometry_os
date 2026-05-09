; DESCRIPTION: Places a yellow 116x25 rectangle at position (314, 163).
; PLAN: r0=314(x), r1=163(y), r2=116(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 163
LDI r2, 116
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
