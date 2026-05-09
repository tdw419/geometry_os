; DESCRIPTION: Renders a red box of size 23x65 starting at (368, 22).
; PLAN: r0=368(x), r1=22(y), r2=23(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 22
LDI r2, 23
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
