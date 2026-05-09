; DESCRIPTION: Places a black 61x46 rectangle at position (22, 20).
; PLAN: r0=22(x), r1=20(y), r2=61(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 20
LDI r2, 61
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
