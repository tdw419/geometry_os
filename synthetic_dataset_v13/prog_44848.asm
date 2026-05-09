; DESCRIPTION: Places a black 62x100 rectangle at position (280, 2).
; PLAN: r0=280(x), r1=2(y), r2=62(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 2
LDI r2, 62
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
