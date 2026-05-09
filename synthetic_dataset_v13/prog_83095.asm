; DESCRIPTION: Creates a purple rectangular region at (362, 126) spanning 116 by 101 pixels.
; PLAN: r0=362(x), r1=126(y), r2=116(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 126
LDI r2, 116
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
