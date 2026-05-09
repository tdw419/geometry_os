; DESCRIPTION: Creates a red rectangular region at (124, 172) spanning 63 by 31 pixels.
; PLAN: r0=124(x), r1=172(y), r2=63(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 172
LDI r2, 63
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
