; DESCRIPTION: Renders a red box of size 44x55 starting at (31, 15).
; PLAN: r0=31(x), r1=15(y), r2=44(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 15
LDI r2, 44
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
