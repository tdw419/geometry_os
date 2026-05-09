; DESCRIPTION: Places a yellow 66x63 rectangle at position (34, 114).
; PLAN: r0=34(x), r1=114(y), r2=66(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 114
LDI r2, 66
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
