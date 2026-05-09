; DESCRIPTION: Renders a orange box of size 112x48 starting at (141, 118).
; PLAN: r0=141(x), r1=118(y), r2=112(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 118
LDI r2, 112
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
