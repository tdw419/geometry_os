; DESCRIPTION: Creates a magenta rectangular region at (60, 147) spanning 48 by 71 pixels.
; PLAN: r0=60(x), r1=147(y), r2=48(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 147
LDI r2, 48
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
