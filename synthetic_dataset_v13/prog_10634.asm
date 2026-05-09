; DESCRIPTION: Places a magenta 87x109 rectangle at position (406, 74).
; PLAN: r0=406(x), r1=74(y), r2=87(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 74
LDI r2, 87
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
