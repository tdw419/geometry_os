; DESCRIPTION: Creates a red rectangular region at (302, 69) spanning 104 by 35 pixels.
; PLAN: r0=302(x), r1=69(y), r2=104(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 69
LDI r2, 104
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
