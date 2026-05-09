; DESCRIPTION: Creates a red rectangular region at (423, 181) spanning 72 by 17 pixels.
; PLAN: r0=423(x), r1=181(y), r2=72(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 181
LDI r2, 72
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
