; DESCRIPTION: Places a yellow 56x112 rectangle at position (81, 22).
; PLAN: r0=81(x), r1=22(y), r2=56(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 22
LDI r2, 56
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
