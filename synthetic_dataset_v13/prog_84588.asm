; DESCRIPTION: Creates a purple rectangular region at (408, 17) spanning 93 by 87 pixels.
; PLAN: r0=408(x), r1=17(y), r2=93(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 17
LDI r2, 93
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
