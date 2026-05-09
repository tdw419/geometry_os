; DESCRIPTION: Creates a blue rectangular region at (59, 205) spanning 118 by 40 pixels.
; PLAN: r0=59(x), r1=205(y), r2=118(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 205
LDI r2, 118
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
