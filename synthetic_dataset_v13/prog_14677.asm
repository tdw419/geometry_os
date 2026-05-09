; DESCRIPTION: Creates a white rectangular region at (412, 179) spanning 96 by 69 pixels.
; PLAN: r0=412(x), r1=179(y), r2=96(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 179
LDI r2, 96
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
