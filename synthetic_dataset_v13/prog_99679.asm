; DESCRIPTION: Creates a purple rectangular region at (414, 178) spanning 65 by 70 pixels.
; PLAN: r0=414(x), r1=178(y), r2=65(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 178
LDI r2, 65
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
