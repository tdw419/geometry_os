; DESCRIPTION: Creates a magenta rectangular region at (371, 32) spanning 77 by 13 pixels.
; PLAN: r0=371(x), r1=32(y), r2=77(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 32
LDI r2, 77
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
