; DESCRIPTION: Creates a purple rectangular region at (304, 3) spanning 39 by 61 pixels.
; PLAN: r0=304(x), r1=3(y), r2=39(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 3
LDI r2, 39
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
