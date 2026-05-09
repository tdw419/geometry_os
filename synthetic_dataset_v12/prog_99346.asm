; DESCRIPTION: Places a black 19x66 rectangle at position (369, 0).
; PLAN: r0=369(x), r1=0(y), r2=19(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 0
LDI r2, 19
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
