; DESCRIPTION: Creates a green rectangular region at (415, 162) spanning 22 by 69 pixels.
; PLAN: r0=415(x), r1=162(y), r2=22(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 162
LDI r2, 22
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
