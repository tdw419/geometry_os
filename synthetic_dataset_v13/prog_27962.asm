; DESCRIPTION: Places a purple 102x22 rectangle at position (265, 78).
; PLAN: r0=265(x), r1=78(y), r2=102(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 78
LDI r2, 102
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
