; DESCRIPTION: Creates a green rectangular region at (69, 187) spanning 15 by 69 pixels.
; PLAN: r0=69(x), r1=187(y), r2=15(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 187
LDI r2, 15
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
