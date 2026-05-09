; DESCRIPTION: Creates a blue rectangular region at (70, 59) spanning 100 by 68 pixels.
; PLAN: r0=70(x), r1=59(y), r2=100(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 59
LDI r2, 100
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
