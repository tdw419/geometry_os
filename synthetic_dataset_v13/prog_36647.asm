; DESCRIPTION: Creates a purple rectangular region at (199, 77) spanning 116 by 50 pixels.
; PLAN: r0=199(x), r1=77(y), r2=116(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 77
LDI r2, 116
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
