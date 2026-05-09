; DESCRIPTION: Creates a blue rectangular region at (262, 121) spanning 33 by 67 pixels.
; PLAN: r0=262(x), r1=121(y), r2=33(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 121
LDI r2, 33
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
