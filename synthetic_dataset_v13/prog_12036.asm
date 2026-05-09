; DESCRIPTION: Places a yellow 28x100 rectangle at position (472, 148).
; PLAN: r0=472(x), r1=148(y), r2=28(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 148
LDI r2, 28
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
