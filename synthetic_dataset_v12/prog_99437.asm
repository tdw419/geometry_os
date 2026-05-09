; DESCRIPTION: Creates a blue rectangular region at (187, 36) spanning 35 by 46 pixels.
; PLAN: r0=187(x), r1=36(y), r2=35(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 36
LDI r2, 35
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
