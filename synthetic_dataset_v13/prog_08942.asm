; DESCRIPTION: Places a magenta 28x99 rectangle at position (454, 127).
; PLAN: r0=454(x), r1=127(y), r2=28(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 127
LDI r2, 28
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
