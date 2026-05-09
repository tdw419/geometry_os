; DESCRIPTION: Creates a blue rectangular region at (365, 23) spanning 95 by 67 pixels.
; PLAN: r0=365(x), r1=23(y), r2=95(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 23
LDI r2, 95
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
