; DESCRIPTION: Creates a red rectangular region at (123, 11) spanning 80 by 57 pixels.
; PLAN: r0=123(x), r1=11(y), r2=80(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 11
LDI r2, 80
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
