; DESCRIPTION: Creates a magenta rectangular region at (107, 212) spanning 58 by 21 pixels.
; PLAN: r0=107(x), r1=212(y), r2=58(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 212
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
