; DESCRIPTION: Renders a red box of size 96x96 starting at (218, 137).
; PLAN: r0=218(x), r1=137(y), r2=96(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 137
LDI r2, 96
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
