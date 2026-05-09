; DESCRIPTION: Places a yellow 11x37 rectangle at position (86, 138).
; PLAN: r0=86(x), r1=138(y), r2=11(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 138
LDI r2, 11
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
