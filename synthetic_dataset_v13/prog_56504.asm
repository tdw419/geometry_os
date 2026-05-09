; DESCRIPTION: Places a black 10x22 rectangle at position (162, 140).
; PLAN: r0=162(x), r1=140(y), r2=10(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 140
LDI r2, 10
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
