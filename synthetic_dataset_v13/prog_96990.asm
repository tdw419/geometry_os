; DESCRIPTION: Creates a green rectangular region at (425, 16) spanning 67 by 99 pixels.
; PLAN: r0=425(x), r1=16(y), r2=67(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 16
LDI r2, 67
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
