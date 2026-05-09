; DESCRIPTION: Places a yellow 17x12 rectangle at position (444, 11).
; PLAN: r0=444(x), r1=11(y), r2=17(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 11
LDI r2, 17
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
