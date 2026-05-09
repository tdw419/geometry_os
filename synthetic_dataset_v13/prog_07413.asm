; DESCRIPTION: Renders a red box of size 119x59 starting at (217, 179).
; PLAN: r0=217(x), r1=179(y), r2=119(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 179
LDI r2, 119
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
