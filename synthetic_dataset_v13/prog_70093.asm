; DESCRIPTION: Creates a purple rectangular region at (206, 55) spanning 103 by 116 pixels.
; PLAN: r0=206(x), r1=55(y), r2=103(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 55
LDI r2, 103
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
