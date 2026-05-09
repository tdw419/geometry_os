; DESCRIPTION: Creates a blue rectangular region at (182, 156) spanning 52 by 39 pixels.
; PLAN: r0=182(x), r1=156(y), r2=52(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 156
LDI r2, 52
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
