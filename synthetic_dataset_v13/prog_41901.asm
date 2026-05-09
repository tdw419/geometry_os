; DESCRIPTION: Creates a blue rectangular region at (275, 156) spanning 34 by 90 pixels.
; PLAN: r0=275(x), r1=156(y), r2=34(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 156
LDI r2, 34
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
