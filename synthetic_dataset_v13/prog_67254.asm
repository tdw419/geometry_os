; DESCRIPTION: Creates a blue rectangular region at (428, 131) spanning 36 by 67 pixels.
; PLAN: r0=428(x), r1=131(y), r2=36(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 131
LDI r2, 36
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
