; DESCRIPTION: Places a yellow 96x107 rectangle at position (203, 2).
; PLAN: r0=203(x), r1=2(y), r2=96(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 2
LDI r2, 96
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
