; DESCRIPTION: Places a yellow 29x63 rectangle at position (93, 183).
; PLAN: r0=93(x), r1=183(y), r2=29(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 183
LDI r2, 29
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
