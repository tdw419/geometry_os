; DESCRIPTION: Places a purple 95x112 rectangle at position (231, 75).
; PLAN: r0=231(x), r1=75(y), r2=95(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 75
LDI r2, 95
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
