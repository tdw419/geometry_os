; DESCRIPTION: Places a black 21x14 rectangle at position (20, 189).
; PLAN: r0=20(x), r1=189(y), r2=21(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 189
LDI r2, 21
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
