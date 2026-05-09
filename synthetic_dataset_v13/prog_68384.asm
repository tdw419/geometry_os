; DESCRIPTION: Creates a purple rectangular region at (50, 5) spanning 116 by 46 pixels.
; PLAN: r0=50(x), r1=5(y), r2=116(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 5
LDI r2, 116
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
