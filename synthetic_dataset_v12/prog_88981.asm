; DESCRIPTION: Creates a purple rectangular region at (143, 10) spanning 117 by 73 pixels.
; PLAN: r0=143(x), r1=10(y), r2=117(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 10
LDI r2, 117
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
