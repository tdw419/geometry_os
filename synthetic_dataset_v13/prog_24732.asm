; DESCRIPTION: Places a yellow 17x44 rectangle at position (96, 181).
; PLAN: r0=96(x), r1=181(y), r2=17(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 181
LDI r2, 17
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
