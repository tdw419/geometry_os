; DESCRIPTION: Creates a red rectangular region at (310, 124) spanning 66 by 97 pixels.
; PLAN: r0=310(x), r1=124(y), r2=66(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 124
LDI r2, 66
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
