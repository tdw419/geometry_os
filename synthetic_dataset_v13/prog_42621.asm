; DESCRIPTION: Creates a purple rectangular region at (342, 207) spanning 69 by 32 pixels.
; PLAN: r0=342(x), r1=207(y), r2=69(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 207
LDI r2, 69
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
