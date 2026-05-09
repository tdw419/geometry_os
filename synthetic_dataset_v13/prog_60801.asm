; DESCRIPTION: Creates a magenta rectangular region at (244, 80) spanning 37 by 86 pixels.
; PLAN: r0=244(x), r1=80(y), r2=37(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 80
LDI r2, 37
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
