; DESCRIPTION: Places a yellow 112x11 rectangle at position (78, 66).
; PLAN: r0=78(x), r1=66(y), r2=112(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 66
LDI r2, 112
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
