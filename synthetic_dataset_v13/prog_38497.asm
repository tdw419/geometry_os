; DESCRIPTION: Creates a red rectangular region at (359, 33) spanning 10 by 13 pixels.
; PLAN: r0=359(x), r1=33(y), r2=10(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 33
LDI r2, 10
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
