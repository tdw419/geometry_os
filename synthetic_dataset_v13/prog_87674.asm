; DESCRIPTION: Creates a magenta rectangular region at (409, 87) spanning 47 by 21 pixels.
; PLAN: r0=409(x), r1=87(y), r2=47(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 87
LDI r2, 47
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
