; DESCRIPTION: Creates a green rectangular region at (334, 103) spanning 44 by 45 pixels.
; PLAN: r0=334(x), r1=103(y), r2=44(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 103
LDI r2, 44
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
