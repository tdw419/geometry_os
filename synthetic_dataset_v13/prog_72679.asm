; DESCRIPTION: Creates a purple rectangular region at (354, 4) spanning 59 by 102 pixels.
; PLAN: r0=354(x), r1=4(y), r2=59(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 4
LDI r2, 59
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
