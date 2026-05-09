; DESCRIPTION: Renders a red box of size 114x66 starting at (202, 121).
; PLAN: r0=202(x), r1=121(y), r2=114(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 121
LDI r2, 114
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
