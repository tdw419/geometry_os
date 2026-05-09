; DESCRIPTION: Places a yellow 36x96 rectangle at position (100, 149).
; PLAN: r0=100(x), r1=149(y), r2=36(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 149
LDI r2, 36
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
