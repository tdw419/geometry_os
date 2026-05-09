; DESCRIPTION: Renders a red box of size 81x35 starting at (44, 164).
; PLAN: r0=44(x), r1=164(y), r2=81(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 164
LDI r2, 81
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
