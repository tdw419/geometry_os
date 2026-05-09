; DESCRIPTION: Creates a green rectangular region at (429, 38) spanning 78 by 72 pixels.
; PLAN: r0=429(x), r1=38(y), r2=78(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 38
LDI r2, 78
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
