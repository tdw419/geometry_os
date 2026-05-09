; DESCRIPTION: Creates a blue rectangular region at (400, 109) spanning 19 by 53 pixels.
; PLAN: r0=400(x), r1=109(y), r2=19(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 109
LDI r2, 19
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
