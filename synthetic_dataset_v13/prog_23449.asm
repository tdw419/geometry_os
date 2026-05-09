; DESCRIPTION: Renders a red box of size 40x55 starting at (322, 162).
; PLAN: r0=322(x), r1=162(y), r2=40(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 162
LDI r2, 40
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
