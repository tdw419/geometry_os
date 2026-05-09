; DESCRIPTION: Creates a red rectangular region at (244, 156) spanning 68 by 77 pixels.
; PLAN: r0=244(x), r1=156(y), r2=68(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 156
LDI r2, 68
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
