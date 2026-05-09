; DESCRIPTION: Creates a purple rectangular region at (346, 143) spanning 96 by 74 pixels.
; PLAN: r0=346(x), r1=143(y), r2=96(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 143
LDI r2, 96
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
