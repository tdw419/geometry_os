; DESCRIPTION: Creates a yellow rectangular region at (370, 94) spanning 68 by 53 pixels.
; PLAN: r0=370(x), r1=94(y), r2=68(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 94
LDI r2, 68
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
