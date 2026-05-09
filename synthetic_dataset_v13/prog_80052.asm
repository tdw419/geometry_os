; DESCRIPTION: Places a purple 16x44 rectangle at position (323, 196).
; PLAN: r0=323(x), r1=196(y), r2=16(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 196
LDI r2, 16
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
