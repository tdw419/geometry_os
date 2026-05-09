; DESCRIPTION: Creates a magenta rectangular region at (177, 97) spanning 33 by 16 pixels.
; PLAN: r0=177(x), r1=97(y), r2=33(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 97
LDI r2, 33
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
