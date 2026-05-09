; DESCRIPTION: Creates a magenta rectangular region at (13, 74) spanning 103 by 59 pixels.
; PLAN: r0=13(x), r1=74(y), r2=103(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 74
LDI r2, 103
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
