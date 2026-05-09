; DESCRIPTION: Places a yellow 120x29 rectangle at position (133, 148).
; PLAN: r0=133(x), r1=148(y), r2=120(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 148
LDI r2, 120
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
