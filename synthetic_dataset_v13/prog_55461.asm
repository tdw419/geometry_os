; DESCRIPTION: Creates a magenta rectangular region at (303, 147) spanning 117 by 61 pixels.
; PLAN: r0=303(x), r1=147(y), r2=117(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 147
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
