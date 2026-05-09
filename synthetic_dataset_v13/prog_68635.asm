; DESCRIPTION: Places a black 72x52 rectangle at position (270, 114).
; PLAN: r0=270(x), r1=114(y), r2=72(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 114
LDI r2, 72
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
