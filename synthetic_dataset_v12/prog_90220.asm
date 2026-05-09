; DESCRIPTION: Places a purple 56x44 rectangle at position (87, 95).
; PLAN: r0=87(x), r1=95(y), r2=56(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 95
LDI r2, 56
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
