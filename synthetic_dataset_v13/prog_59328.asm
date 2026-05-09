; DESCRIPTION: Creates a purple rectangular region at (48, 151) spanning 116 by 32 pixels.
; PLAN: r0=48(x), r1=151(y), r2=116(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 151
LDI r2, 116
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
