; DESCRIPTION: Creates a purple rectangular region at (22, 59) spanning 48 by 44 pixels.
; PLAN: r0=22(x), r1=59(y), r2=48(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 59
LDI r2, 48
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
