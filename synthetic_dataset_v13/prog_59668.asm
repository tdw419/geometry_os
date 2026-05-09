; DESCRIPTION: Creates a magenta rectangular region at (272, 137) spanning 61 by 84 pixels.
; PLAN: r0=272(x), r1=137(y), r2=61(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 137
LDI r2, 61
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
