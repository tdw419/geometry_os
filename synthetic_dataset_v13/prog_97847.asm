; DESCRIPTION: Places a yellow 66x72 rectangle at position (56, 109).
; PLAN: r0=56(x), r1=109(y), r2=66(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 109
LDI r2, 66
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
