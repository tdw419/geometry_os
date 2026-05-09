; DESCRIPTION: Creates a blue rectangular region at (33, 1) spanning 117 by 91 pixels.
; PLAN: r0=33(x), r1=1(y), r2=117(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 1
LDI r2, 117
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
