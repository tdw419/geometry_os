; DESCRIPTION: Places a black 91x68 rectangle at position (203, 114).
; PLAN: r0=203(x), r1=114(y), r2=91(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 114
LDI r2, 91
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
