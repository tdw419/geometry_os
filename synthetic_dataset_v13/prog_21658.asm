; DESCRIPTION: Creates a green rectangular region at (352, 29) spanning 69 by 47 pixels.
; PLAN: r0=352(x), r1=29(y), r2=69(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 29
LDI r2, 69
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
