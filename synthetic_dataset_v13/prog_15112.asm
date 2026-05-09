; DESCRIPTION: Creates a purple rectangular region at (152, 134) spanning 105 by 105 pixels.
; PLAN: r0=152(x), r1=134(y), r2=105(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 134
LDI r2, 105
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
