; DESCRIPTION: Renders a red box of size 49x62 starting at (177, 143).
; PLAN: r0=177(x), r1=143(y), r2=49(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 143
LDI r2, 49
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
