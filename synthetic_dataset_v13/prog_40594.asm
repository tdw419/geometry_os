; DESCRIPTION: Renders a red box of size 88x11 starting at (242, 87).
; PLAN: r0=242(x), r1=87(y), r2=88(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 87
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
