; DESCRIPTION: Creates a yellow rectangular region at (398, 0) spanning 73 by 38 pixels.
; PLAN: r0=398(x), r1=0(y), r2=73(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 0
LDI r2, 73
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
