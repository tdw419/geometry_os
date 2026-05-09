; DESCRIPTION: Renders a red box of size 35x81 starting at (202, 140).
; PLAN: r0=202(x), r1=140(y), r2=35(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 140
LDI r2, 35
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
