; DESCRIPTION: Places a yellow 40x81 rectangle at position (260, 87).
; PLAN: r0=260(x), r1=87(y), r2=40(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 87
LDI r2, 40
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
