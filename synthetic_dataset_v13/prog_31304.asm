; DESCRIPTION: Creates a red rectangular region at (353, 194) spanning 58 by 39 pixels.
; PLAN: r0=353(x), r1=194(y), r2=58(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 194
LDI r2, 58
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
