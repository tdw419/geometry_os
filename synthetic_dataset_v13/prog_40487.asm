; DESCRIPTION: Creates a magenta rectangular region at (147, 168) spanning 117 by 49 pixels.
; PLAN: r0=147(x), r1=168(y), r2=117(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 168
LDI r2, 117
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
