; DESCRIPTION: Creates a white rectangular region at (214, 121) spanning 46 by 110 pixels.
; PLAN: r0=214(x), r1=121(y), r2=46(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 121
LDI r2, 46
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
