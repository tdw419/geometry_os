; DESCRIPTION: Creates a red rectangular region at (120, 156) spanning 102 by 63 pixels.
; PLAN: r0=120(x), r1=156(y), r2=102(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 156
LDI r2, 102
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
