; DESCRIPTION: Creates a magenta rectangular region at (406, 18) spanning 34 by 83 pixels.
; PLAN: r0=406(x), r1=18(y), r2=34(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 18
LDI r2, 34
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
