; DESCRIPTION: Creates a purple rectangular region at (40, 116) spanning 111 by 27 pixels.
; PLAN: r0=40(x), r1=116(y), r2=111(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 116
LDI r2, 111
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
