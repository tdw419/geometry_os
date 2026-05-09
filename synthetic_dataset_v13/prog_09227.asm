; DESCRIPTION: Creates a purple rectangular region at (152, 10) spanning 12 by 56 pixels.
; PLAN: r0=152(x), r1=10(y), r2=12(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 10
LDI r2, 12
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
