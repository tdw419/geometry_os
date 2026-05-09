; DESCRIPTION: Renders a red box of size 34x35 starting at (277, 81).
; PLAN: r0=277(x), r1=81(y), r2=34(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 81
LDI r2, 34
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
