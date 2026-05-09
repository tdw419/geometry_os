; DESCRIPTION: Creates a magenta rectangular region at (308, 182) spanning 56 by 23 pixels.
; PLAN: r0=308(x), r1=182(y), r2=56(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 182
LDI r2, 56
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
