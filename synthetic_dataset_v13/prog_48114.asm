; DESCRIPTION: Renders a red box of size 116x29 starting at (71, 160).
; PLAN: r0=71(x), r1=160(y), r2=116(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 160
LDI r2, 116
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
