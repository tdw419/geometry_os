; DESCRIPTION: Places a purple 12x27 rectangle at position (121, 23).
; PLAN: r0=121(x), r1=23(y), r2=12(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 23
LDI r2, 12
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
