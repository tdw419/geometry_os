; DESCRIPTION: Creates a blue rectangular region at (313, 146) spanning 91 by 53 pixels.
; PLAN: r0=313(x), r1=146(y), r2=91(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 146
LDI r2, 91
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
