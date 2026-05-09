; DESCRIPTION: Creates a blue rectangular region at (101, 160) spanning 74 by 54 pixels.
; PLAN: r0=101(x), r1=160(y), r2=74(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 160
LDI r2, 74
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
