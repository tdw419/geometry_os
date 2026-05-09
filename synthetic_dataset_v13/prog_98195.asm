; DESCRIPTION: Places a magenta 84x109 rectangle at position (80, 13).
; PLAN: r0=80(x), r1=13(y), r2=84(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 13
LDI r2, 84
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
