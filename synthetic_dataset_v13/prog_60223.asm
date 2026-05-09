; DESCRIPTION: Places a yellow 66x79 rectangle at position (325, 170).
; PLAN: r0=325(x), r1=170(y), r2=66(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 170
LDI r2, 66
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
