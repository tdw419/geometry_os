; DESCRIPTION: Creates a purple rectangular region at (24, 206) spanning 102 by 36 pixels.
; PLAN: r0=24(x), r1=206(y), r2=102(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 206
LDI r2, 102
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
