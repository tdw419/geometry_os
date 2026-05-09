; DESCRIPTION: Places a purple 120x16 rectangle at position (325, 127).
; PLAN: r0=325(x), r1=127(y), r2=120(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 127
LDI r2, 120
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
