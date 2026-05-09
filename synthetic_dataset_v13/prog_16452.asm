; DESCRIPTION: Creates a magenta rectangular region at (449, 147) spanning 57 by 98 pixels.
; PLAN: r0=449(x), r1=147(y), r2=57(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 147
LDI r2, 57
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
