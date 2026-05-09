; DESCRIPTION: Places a black 28x29 rectangle at position (169, 131).
; PLAN: r0=169(x), r1=131(y), r2=28(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 131
LDI r2, 28
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
