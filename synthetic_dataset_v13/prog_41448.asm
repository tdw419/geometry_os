; DESCRIPTION: Creates a magenta rectangular region at (177, 17) spanning 71 by 115 pixels.
; PLAN: r0=177(x), r1=17(y), r2=71(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 17
LDI r2, 71
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
