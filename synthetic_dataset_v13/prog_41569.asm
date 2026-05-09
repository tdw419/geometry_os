; DESCRIPTION: Places a purple 52x60 rectangle at position (408, 3).
; PLAN: r0=408(x), r1=3(y), r2=52(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 3
LDI r2, 52
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
