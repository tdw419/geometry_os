; DESCRIPTION: Places a purple 77x15 rectangle at position (189, 208).
; PLAN: r0=189(x), r1=208(y), r2=77(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 208
LDI r2, 77
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
