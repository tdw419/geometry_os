; DESCRIPTION: Renders a red box of size 43x80 starting at (226, 8).
; PLAN: r0=226(x), r1=8(y), r2=43(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 8
LDI r2, 43
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
