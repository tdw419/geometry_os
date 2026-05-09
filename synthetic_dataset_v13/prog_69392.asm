; DESCRIPTION: Places a black 11x114 rectangle at position (154, 107).
; PLAN: r0=154(x), r1=107(y), r2=11(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 107
LDI r2, 11
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
