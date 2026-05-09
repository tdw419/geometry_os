; DESCRIPTION: Creates a blue rectangular region at (168, 149) spanning 78 by 100 pixels.
; PLAN: r0=168(x), r1=149(y), r2=78(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 149
LDI r2, 78
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
