; DESCRIPTION: Places a black 109x91 rectangle at position (84, 120).
; PLAN: r0=84(x), r1=120(y), r2=109(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 120
LDI r2, 109
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
