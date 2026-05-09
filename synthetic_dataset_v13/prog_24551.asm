; DESCRIPTION: Creates a blue rectangular region at (244, 187) spanning 95 by 45 pixels.
; PLAN: r0=244(x), r1=187(y), r2=95(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 187
LDI r2, 95
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
