; DESCRIPTION: Creates a red rectangular region at (321, 150) spanning 62 by 66 pixels.
; PLAN: r0=321(x), r1=150(y), r2=62(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 150
LDI r2, 62
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
