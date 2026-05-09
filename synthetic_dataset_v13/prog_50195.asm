; DESCRIPTION: Creates a magenta rectangular region at (80, 209) spanning 30 by 13 pixels.
; PLAN: r0=80(x), r1=209(y), r2=30(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 209
LDI r2, 30
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
