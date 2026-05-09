; DESCRIPTION: Creates a red rectangular region at (397, 107) spanning 33 by 117 pixels.
; PLAN: r0=397(x), r1=107(y), r2=33(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 107
LDI r2, 33
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
