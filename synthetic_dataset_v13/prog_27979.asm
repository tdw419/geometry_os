; DESCRIPTION: Creates a green rectangular region at (252, 222) spanning 67 by 18 pixels.
; PLAN: r0=252(x), r1=222(y), r2=67(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 222
LDI r2, 67
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
