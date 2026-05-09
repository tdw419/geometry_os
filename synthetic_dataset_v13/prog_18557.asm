; DESCRIPTION: Places a yellow 15x76 rectangle at position (222, 101).
; PLAN: r0=222(x), r1=101(y), r2=15(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 101
LDI r2, 15
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
