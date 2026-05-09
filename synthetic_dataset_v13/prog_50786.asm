; DESCRIPTION: Creates a purple rectangular region at (435, 59) spanning 54 by 59 pixels.
; PLAN: r0=435(x), r1=59(y), r2=54(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 59
LDI r2, 54
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
