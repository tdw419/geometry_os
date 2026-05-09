; DESCRIPTION: Creates a blue rectangular region at (401, 91) spanning 58 by 25 pixels.
; PLAN: r0=401(x), r1=91(y), r2=58(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 91
LDI r2, 58
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
