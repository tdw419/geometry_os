; DESCRIPTION: Places a black 55x89 rectangle at position (132, 89).
; PLAN: r0=132(x), r1=89(y), r2=55(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 89
LDI r2, 55
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
