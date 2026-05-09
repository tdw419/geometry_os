; DESCRIPTION: Renders a red box of size 22x20 starting at (382, 92).
; PLAN: r0=382(x), r1=92(y), r2=22(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 92
LDI r2, 22
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
