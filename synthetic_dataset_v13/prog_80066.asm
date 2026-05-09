; DESCRIPTION: Places a green 56x58 rectangle at position (432, 72).
; PLAN: r0=432(x), r1=72(y), r2=56(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 72
LDI r2, 56
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
