; DESCRIPTION: Creates a red rectangular region at (330, 157) spanning 56 by 29 pixels.
; PLAN: r0=330(x), r1=157(y), r2=56(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 157
LDI r2, 56
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
