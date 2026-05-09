; DESCRIPTION: Places a blue 23x113 rectangle at position (154, 87).
; PLAN: r0=154(x), r1=87(y), r2=23(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 87
LDI r2, 23
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
