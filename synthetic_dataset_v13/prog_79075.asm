; DESCRIPTION: Creates a blue rectangular region at (214, 101) spanning 93 by 99 pixels.
; PLAN: r0=214(x), r1=101(y), r2=93(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 101
LDI r2, 93
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
