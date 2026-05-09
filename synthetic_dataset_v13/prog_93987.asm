; DESCRIPTION: Creates a blue rectangular region at (361, 114) spanning 102 by 98 pixels.
; PLAN: r0=361(x), r1=114(y), r2=102(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 114
LDI r2, 102
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
