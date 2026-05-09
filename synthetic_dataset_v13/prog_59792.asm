; DESCRIPTION: Places a yellow 105x22 rectangle at position (103, 96).
; PLAN: r0=103(x), r1=96(y), r2=105(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 96
LDI r2, 105
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
