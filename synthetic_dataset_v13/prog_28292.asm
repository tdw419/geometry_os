; DESCRIPTION: Places a red 28x22 rectangle at position (223, 79).
; PLAN: r0=223(x), r1=79(y), r2=28(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 79
LDI r2, 28
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
