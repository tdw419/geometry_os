; DESCRIPTION: Creates a purple rectangular region at (96, 82) spanning 59 by 99 pixels.
; PLAN: r0=96(x), r1=82(y), r2=59(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 82
LDI r2, 59
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
