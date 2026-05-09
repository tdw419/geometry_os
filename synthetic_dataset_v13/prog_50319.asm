; DESCRIPTION: Creates a yellow rectangular region at (397, 194) spanning 60 by 26 pixels.
; PLAN: r0=397(x), r1=194(y), r2=60(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 194
LDI r2, 60
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
