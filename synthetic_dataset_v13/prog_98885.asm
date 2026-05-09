; DESCRIPTION: Renders a red box of size 77x73 starting at (206, 17).
; PLAN: r0=206(x), r1=17(y), r2=77(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 17
LDI r2, 77
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
