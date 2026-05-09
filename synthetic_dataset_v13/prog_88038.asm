; DESCRIPTION: Creates a magenta rectangular region at (63, 117) spanning 38 by 79 pixels.
; PLAN: r0=63(x), r1=117(y), r2=38(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 117
LDI r2, 38
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
