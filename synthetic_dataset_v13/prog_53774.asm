; DESCRIPTION: Places a blue 71x117 rectangle at position (291, 71).
; PLAN: r0=291(x), r1=71(y), r2=71(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 71
LDI r2, 71
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
