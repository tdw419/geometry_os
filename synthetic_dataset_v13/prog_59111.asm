; DESCRIPTION: Creates a magenta rectangular region at (177, 33) spanning 20 by 85 pixels.
; PLAN: r0=177(x), r1=33(y), r2=20(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 33
LDI r2, 20
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
