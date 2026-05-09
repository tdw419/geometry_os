; DESCRIPTION: Places a red 101x84 rectangle at position (55, 64).
; PLAN: r0=55(x), r1=64(y), r2=101(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 64
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
