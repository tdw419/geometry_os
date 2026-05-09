; DESCRIPTION: Renders a red box of size 62x22 starting at (394, 185).
; PLAN: r0=394(x), r1=185(y), r2=62(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 185
LDI r2, 62
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
