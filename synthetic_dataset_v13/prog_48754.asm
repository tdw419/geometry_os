; DESCRIPTION: Creates a red rectangular region at (396, 46) spanning 78 by 91 pixels.
; PLAN: r0=396(x), r1=46(y), r2=78(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 46
LDI r2, 78
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
