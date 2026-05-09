; DESCRIPTION: Creates a green rectangular region at (17, 207) spanning 39 by 43 pixels.
; PLAN: r0=17(x), r1=207(y), r2=39(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 207
LDI r2, 39
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
