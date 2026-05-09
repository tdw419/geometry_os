; DESCRIPTION: Renders a red box of size 112x95 starting at (175, 12).
; PLAN: r0=175(x), r1=12(y), r2=112(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 12
LDI r2, 112
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
