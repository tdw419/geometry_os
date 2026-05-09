; DESCRIPTION: Places a magenta 90x14 rectangle at position (142, 26).
; PLAN: r0=142(x), r1=26(y), r2=90(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 26
LDI r2, 90
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
