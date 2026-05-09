; DESCRIPTION: Places a yellow 97x92 rectangle at position (105, 103).
; PLAN: r0=105(x), r1=103(y), r2=97(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 103
LDI r2, 97
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
