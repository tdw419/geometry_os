; DESCRIPTION: Creates a red rectangular region at (406, 56) spanning 60 by 117 pixels.
; PLAN: r0=406(x), r1=56(y), r2=60(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 56
LDI r2, 60
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
