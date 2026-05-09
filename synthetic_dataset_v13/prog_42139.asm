; DESCRIPTION: Places a purple 52x44 rectangle at position (178, 207).
; PLAN: r0=178(x), r1=207(y), r2=52(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 207
LDI r2, 52
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
