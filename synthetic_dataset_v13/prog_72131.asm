; DESCRIPTION: Creates a green rectangular region at (197, 1) spanning 67 by 91 pixels.
; PLAN: r0=197(x), r1=1(y), r2=67(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 1
LDI r2, 67
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
