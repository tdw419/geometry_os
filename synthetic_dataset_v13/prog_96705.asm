; DESCRIPTION: Places a yellow 84x105 rectangle at position (427, 21).
; PLAN: r0=427(x), r1=21(y), r2=84(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 21
LDI r2, 84
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
