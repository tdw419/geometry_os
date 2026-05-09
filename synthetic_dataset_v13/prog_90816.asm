; DESCRIPTION: Places a white 91x56 rectangle at position (109, 114).
; PLAN: r0=109(x), r1=114(y), r2=91(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 114
LDI r2, 91
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
