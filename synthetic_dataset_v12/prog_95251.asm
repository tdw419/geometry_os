; DESCRIPTION: Renders a red box of size 110x102 starting at (177, 47).
; PLAN: r0=177(x), r1=47(y), r2=110(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 47
LDI r2, 110
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
