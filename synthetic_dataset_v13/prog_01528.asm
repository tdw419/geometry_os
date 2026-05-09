; DESCRIPTION: Creates a magenta rectangular region at (76, 70) spanning 120 by 63 pixels.
; PLAN: r0=76(x), r1=70(y), r2=120(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 70
LDI r2, 120
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
