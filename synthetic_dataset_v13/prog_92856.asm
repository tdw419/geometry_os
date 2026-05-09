; DESCRIPTION: Places a black 85x22 rectangle at position (368, 0).
; PLAN: r0=368(x), r1=0(y), r2=85(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 0
LDI r2, 85
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
