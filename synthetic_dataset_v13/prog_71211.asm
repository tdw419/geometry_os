; DESCRIPTION: Places a magenta 21x81 rectangle at position (416, 4).
; PLAN: r0=416(x), r1=4(y), r2=21(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 4
LDI r2, 21
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
