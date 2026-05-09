; DESCRIPTION: Creates a magenta rectangular region at (288, 31) spanning 61 by 103 pixels.
; PLAN: r0=288(x), r1=31(y), r2=61(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 31
LDI r2, 61
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
