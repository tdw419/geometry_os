; DESCRIPTION: Creates a green rectangular region at (231, 109) spanning 73 by 67 pixels.
; PLAN: r0=231(x), r1=109(y), r2=73(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 109
LDI r2, 73
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
