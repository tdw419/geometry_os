; DESCRIPTION: Renders a red box of size 114x68 starting at (374, 96).
; PLAN: r0=374(x), r1=96(y), r2=114(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 96
LDI r2, 114
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
