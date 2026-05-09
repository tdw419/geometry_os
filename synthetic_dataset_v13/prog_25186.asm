; DESCRIPTION: Creates a magenta rectangular region at (83, 147) spanning 32 by 61 pixels.
; PLAN: r0=83(x), r1=147(y), r2=32(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 147
LDI r2, 32
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
