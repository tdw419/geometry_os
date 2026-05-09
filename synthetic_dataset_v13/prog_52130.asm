; DESCRIPTION: Creates a blue rectangular region at (380, 162) spanning 109 by 53 pixels.
; PLAN: r0=380(x), r1=162(y), r2=109(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 162
LDI r2, 109
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
