; DESCRIPTION: Creates a blue rectangular region at (197, 36) spanning 109 by 88 pixels.
; PLAN: r0=197(x), r1=36(y), r2=109(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 36
LDI r2, 109
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
