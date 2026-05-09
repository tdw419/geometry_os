; DESCRIPTION: Renders a red box of size 49x104 starting at (161, 83).
; PLAN: r0=161(x), r1=83(y), r2=49(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 83
LDI r2, 49
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
