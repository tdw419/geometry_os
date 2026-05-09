; DESCRIPTION: Creates a green rectangular region at (197, 69) spanning 75 by 33 pixels.
; PLAN: r0=197(x), r1=69(y), r2=75(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 69
LDI r2, 75
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
