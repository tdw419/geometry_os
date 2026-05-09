; DESCRIPTION: Creates a red rectangular region at (46, 69) spanning 15 by 69 pixels.
; PLAN: r0=46(x), r1=69(y), r2=15(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 69
LDI r2, 15
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
