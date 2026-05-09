; DESCRIPTION: Creates a purple rectangular region at (293, 85) spanning 116 by 71 pixels.
; PLAN: r0=293(x), r1=85(y), r2=116(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 85
LDI r2, 116
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
