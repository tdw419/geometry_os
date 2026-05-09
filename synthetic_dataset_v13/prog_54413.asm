; DESCRIPTION: Creates a magenta rectangular region at (371, 40) spanning 65 by 103 pixels.
; PLAN: r0=371(x), r1=40(y), r2=65(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 40
LDI r2, 65
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
