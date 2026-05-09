; DESCRIPTION: Places a black 112x80 rectangle at position (177, 101).
; PLAN: r0=177(x), r1=101(y), r2=112(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 101
LDI r2, 112
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
