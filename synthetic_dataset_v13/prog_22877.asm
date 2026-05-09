; DESCRIPTION: Places a yellow 112x17 rectangle at position (281, 145).
; PLAN: r0=281(x), r1=145(y), r2=112(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 145
LDI r2, 112
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
