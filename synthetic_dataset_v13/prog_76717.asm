; DESCRIPTION: Creates a blue rectangular region at (405, 24) spanning 47 by 69 pixels.
; PLAN: r0=405(x), r1=24(y), r2=47(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 24
LDI r2, 47
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
