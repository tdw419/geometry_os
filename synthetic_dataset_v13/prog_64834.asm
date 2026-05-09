; DESCRIPTION: Places a yellow 110x81 rectangle at position (37, 92).
; PLAN: r0=37(x), r1=92(y), r2=110(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 92
LDI r2, 110
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
