; DESCRIPTION: Places a black 66x72 rectangle at position (303, 0).
; PLAN: r0=303(x), r1=0(y), r2=66(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 0
LDI r2, 66
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
