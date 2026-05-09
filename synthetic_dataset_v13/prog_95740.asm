; DESCRIPTION: Renders a red box of size 109x54 starting at (356, 130).
; PLAN: r0=356(x), r1=130(y), r2=109(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 130
LDI r2, 109
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
