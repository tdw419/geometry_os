; DESCRIPTION: Places a blue 101x33 rectangle at position (265, 194).
; PLAN: r0=265(x), r1=194(y), r2=101(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 194
LDI r2, 101
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
