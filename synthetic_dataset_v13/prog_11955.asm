; DESCRIPTION: Places a magenta 37x59 rectangle at position (255, 87).
; PLAN: r0=255(x), r1=87(y), r2=37(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 87
LDI r2, 37
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
