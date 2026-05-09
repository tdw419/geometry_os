; DESCRIPTION: Creates a green rectangular region at (355, 39) spanning 30 by 85 pixels.
; PLAN: r0=355(x), r1=39(y), r2=30(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 39
LDI r2, 30
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
