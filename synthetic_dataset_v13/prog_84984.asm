; DESCRIPTION: Places a yellow 36x112 rectangle at position (339, 76).
; PLAN: r0=339(x), r1=76(y), r2=36(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 76
LDI r2, 36
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
