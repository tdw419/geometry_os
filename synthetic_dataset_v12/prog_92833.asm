; DESCRIPTION: Creates a magenta rectangular region at (274, 192) spanning 44 by 57 pixels.
; PLAN: r0=274(x), r1=192(y), r2=44(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 192
LDI r2, 44
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
