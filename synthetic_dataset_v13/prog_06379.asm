; DESCRIPTION: Creates a blue rectangular region at (304, 59) spanning 49 by 53 pixels.
; PLAN: r0=304(x), r1=59(y), r2=49(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 59
LDI r2, 49
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
