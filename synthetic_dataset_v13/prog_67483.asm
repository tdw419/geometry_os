; DESCRIPTION: Places a yellow 11x80 rectangle at position (423, 138).
; PLAN: r0=423(x), r1=138(y), r2=11(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 138
LDI r2, 11
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
