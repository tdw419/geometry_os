; DESCRIPTION: Places a magenta 80x35 rectangle at position (49, 86).
; PLAN: r0=49(x), r1=86(y), r2=80(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 86
LDI r2, 80
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
