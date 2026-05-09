; DESCRIPTION: Creates a magenta rectangular region at (153, 71) spanning 115 by 103 pixels.
; PLAN: r0=153(x), r1=71(y), r2=115(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 71
LDI r2, 115
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
