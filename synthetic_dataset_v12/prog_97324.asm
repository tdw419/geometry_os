; DESCRIPTION: Renders a red box of size 25x84 starting at (204, 130).
; PLAN: r0=204(x), r1=130(y), r2=25(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 130
LDI r2, 25
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
