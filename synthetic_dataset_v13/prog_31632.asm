; DESCRIPTION: Creates a green rectangular region at (91, 35) spanning 60 by 67 pixels.
; PLAN: r0=91(x), r1=35(y), r2=60(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 35
LDI r2, 60
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
