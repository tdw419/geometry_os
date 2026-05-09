; DESCRIPTION: Places a yellow 119x68 rectangle at position (113, 185).
; PLAN: r0=113(x), r1=185(y), r2=119(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 185
LDI r2, 119
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
