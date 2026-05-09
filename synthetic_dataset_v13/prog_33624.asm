; DESCRIPTION: Creates a blue rectangular region at (118, 102) spanning 50 by 44 pixels.
; PLAN: r0=118(x), r1=102(y), r2=50(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 102
LDI r2, 50
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
