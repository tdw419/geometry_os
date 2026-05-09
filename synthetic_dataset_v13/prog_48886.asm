; DESCRIPTION: Creates a purple rectangular region at (191, 127) spanning 59 by 13 pixels.
; PLAN: r0=191(x), r1=127(y), r2=59(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 127
LDI r2, 59
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
