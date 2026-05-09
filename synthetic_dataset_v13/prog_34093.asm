; DESCRIPTION: Creates a magenta rectangular region at (229, 159) spanning 13 by 63 pixels.
; PLAN: r0=229(x), r1=159(y), r2=13(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 159
LDI r2, 13
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
