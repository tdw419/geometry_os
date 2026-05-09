; DESCRIPTION: Creates a magenta rectangular region at (16, 59) spanning 94 by 79 pixels.
; PLAN: r0=16(x), r1=59(y), r2=94(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 59
LDI r2, 94
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
