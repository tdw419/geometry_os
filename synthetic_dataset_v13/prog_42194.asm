; DESCRIPTION: Renders a white box of size 99x35 starting at (5, 182).
; PLAN: r0=5(x), r1=182(y), r2=99(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 182
LDI r2, 99
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
