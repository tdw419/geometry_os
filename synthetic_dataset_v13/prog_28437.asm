; DESCRIPTION: Places a blue 112x26 rectangle at position (131, 156).
; PLAN: r0=131(x), r1=156(y), r2=112(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 156
LDI r2, 112
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
