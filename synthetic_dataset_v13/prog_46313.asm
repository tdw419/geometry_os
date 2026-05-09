; DESCRIPTION: Creates a yellow rectangular region at (184, 161) spanning 98 by 46 pixels.
; PLAN: r0=184(x), r1=161(y), r2=98(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 161
LDI r2, 98
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
