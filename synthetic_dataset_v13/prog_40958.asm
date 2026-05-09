; DESCRIPTION: Creates a purple rectangular region at (342, 59) spanning 22 by 64 pixels.
; PLAN: r0=342(x), r1=59(y), r2=22(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 59
LDI r2, 22
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
