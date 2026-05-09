; DESCRIPTION: Places a purple 27x58 rectangle at position (98, 162).
; PLAN: r0=98(x), r1=162(y), r2=27(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 162
LDI r2, 27
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
