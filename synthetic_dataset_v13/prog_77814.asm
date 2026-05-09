; DESCRIPTION: Places a green 23x56 rectangle at position (141, 138).
; PLAN: r0=141(x), r1=138(y), r2=23(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 138
LDI r2, 23
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
