; DESCRIPTION: Creates a red rectangular region at (372, 30) spanning 97 by 84 pixels.
; PLAN: r0=372(x), r1=30(y), r2=97(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 30
LDI r2, 97
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
