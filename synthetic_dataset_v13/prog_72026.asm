; DESCRIPTION: Creates a yellow rectangular region at (95, 94) spanning 69 by 54 pixels.
; PLAN: r0=95(x), r1=94(y), r2=69(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 94
LDI r2, 69
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
