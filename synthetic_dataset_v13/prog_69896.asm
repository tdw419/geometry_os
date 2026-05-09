; DESCRIPTION: Places a blue 85x80 rectangle at position (424, 19).
; PLAN: r0=424(x), r1=19(y), r2=85(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 19
LDI r2, 85
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
