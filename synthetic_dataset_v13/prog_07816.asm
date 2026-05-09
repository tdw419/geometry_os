; DESCRIPTION: Creates a purple rectangular region at (270, 95) spanning 12 by 103 pixels.
; PLAN: r0=270(x), r1=95(y), r2=12(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 95
LDI r2, 12
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
