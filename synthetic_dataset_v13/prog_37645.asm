; DESCRIPTION: Creates a blue rectangular region at (298, 161) spanning 49 by 95 pixels.
; PLAN: r0=298(x), r1=161(y), r2=49(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 161
LDI r2, 49
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
