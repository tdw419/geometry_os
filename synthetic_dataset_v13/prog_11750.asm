; DESCRIPTION: Creates a red rectangular region at (33, 62) spanning 63 by 60 pixels.
; PLAN: r0=33(x), r1=62(y), r2=63(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 62
LDI r2, 63
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
