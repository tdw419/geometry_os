; DESCRIPTION: Places a purple 87x27 rectangle at position (44, 148).
; PLAN: r0=44(x), r1=148(y), r2=87(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 148
LDI r2, 87
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
