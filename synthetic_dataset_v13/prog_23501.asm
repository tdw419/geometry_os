; DESCRIPTION: Creates a magenta rectangular region at (97, 154) spanning 120 by 60 pixels.
; PLAN: r0=97(x), r1=154(y), r2=120(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 154
LDI r2, 120
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
