; DESCRIPTION: Places a yellow 33x101 rectangle at position (191, 30).
; PLAN: r0=191(x), r1=30(y), r2=33(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 30
LDI r2, 33
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
