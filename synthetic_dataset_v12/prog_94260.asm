; DESCRIPTION: Places a black 79x89 rectangle at position (33, 59).
; PLAN: r0=33(x), r1=59(y), r2=79(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 59
LDI r2, 79
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
