; DESCRIPTION: Renders a red box of size 71x33 starting at (36, 77).
; PLAN: r0=36(x), r1=77(y), r2=71(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 77
LDI r2, 71
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
