; DESCRIPTION: Creates a yellow rectangular region at (370, 109) spanning 69 by 57 pixels.
; PLAN: r0=370(x), r1=109(y), r2=69(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 109
LDI r2, 69
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
