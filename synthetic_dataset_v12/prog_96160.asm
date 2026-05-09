; DESCRIPTION: Places a purple 114x27 rectangle at position (175, 10).
; PLAN: r0=175(x), r1=10(y), r2=114(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 10
LDI r2, 114
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
