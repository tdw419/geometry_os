; DESCRIPTION: Creates a black rectangular region at (197, 69) spanning 91 by 97 pixels.
; PLAN: r0=197(x), r1=69(y), r2=91(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 69
LDI r2, 91
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
