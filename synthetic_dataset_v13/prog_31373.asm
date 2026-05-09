; DESCRIPTION: Creates a blue rectangular region at (245, 67) spanning 117 by 57 pixels.
; PLAN: r0=245(x), r1=67(y), r2=117(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 67
LDI r2, 117
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
