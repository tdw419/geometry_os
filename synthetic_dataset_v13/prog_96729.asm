; DESCRIPTION: Places a purple 88x27 rectangle at position (170, 44).
; PLAN: r0=170(x), r1=44(y), r2=88(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 44
LDI r2, 88
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
