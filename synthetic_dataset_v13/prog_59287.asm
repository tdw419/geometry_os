; DESCRIPTION: Creates a magenta rectangular region at (300, 10) spanning 112 by 13 pixels.
; PLAN: r0=300(x), r1=10(y), r2=112(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 10
LDI r2, 112
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
