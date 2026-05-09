; DESCRIPTION: Places a magenta 80x21 rectangle at position (416, 162).
; PLAN: r0=416(x), r1=162(y), r2=80(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 162
LDI r2, 80
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
