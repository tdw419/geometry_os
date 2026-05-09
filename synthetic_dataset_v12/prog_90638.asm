; DESCRIPTION: Places a purple 54x80 rectangle at position (329, 126).
; PLAN: r0=329(x), r1=126(y), r2=54(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 126
LDI r2, 54
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
