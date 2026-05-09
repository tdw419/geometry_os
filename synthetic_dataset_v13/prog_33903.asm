; DESCRIPTION: Creates a green rectangular region at (251, 0) spanning 16 by 67 pixels.
; PLAN: r0=251(x), r1=0(y), r2=16(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 0
LDI r2, 16
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
