; DESCRIPTION: Creates a black rectangular region at (412, 177) spanning 14 by 29 pixels.
; PLAN: r0=412(x), r1=177(y), r2=14(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 177
LDI r2, 14
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
