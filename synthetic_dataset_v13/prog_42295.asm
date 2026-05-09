; DESCRIPTION: Creates a blue rectangular region at (262, 41) spanning 54 by 62 pixels.
; PLAN: r0=262(x), r1=41(y), r2=54(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 41
LDI r2, 54
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
